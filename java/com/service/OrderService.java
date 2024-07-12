package com.service;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServletRequest;

import com.db.DataDb;
import com.dto.FoodDto;
import com.dto.ItemCategoryDto;
import com.dto.OrderDto;
import com.dto.OrderItemDto;
import com.mysql.jdbc.Statement;

public class OrderService {
	



	// Insert Method for Category Item
				public boolean insertOrder(OrderDto dto, HttpServletRequest request, ServletConfig config) throws IOException {
					
					DataDb db = new DataDb(request);
					
					try {
						
						PreparedStatement ps = db.connection.prepareStatement("INSERT INTO orders (CustomerID, CustName, CustMobile, TrainID, TrainNo, TotalAmount, SheetNo, CoachNo)\r\n"
								+ "VALUES (?,?,?,?,?,?,?,?);",Statement.RETURN_GENERATED_KEYS);

						ps.setInt(1, dto.getCustomerID());
						ps.setString(2, dto.getCust_name());
						ps.setString(3, dto.getCust_mobile());
						ps.setInt(4, dto.getTrainID());
						ps.setInt(5, dto.getTrainNumber());
						ps.setFloat(6, 0);
						ps.setInt(7, dto.getSheetNo());
						ps.setString(8, dto.getCoachNo());

						System.out.println(ps);

						int i = ps.executeUpdate();
						
						ResultSet rs_order = ps.getGeneratedKeys();
						rs_order.next();
						int generated_order_id = rs_order.getInt(1);
						
						String foodIdArr[] = dto.getTokan().split(",");
						String foodQunatityArr[] = dto.getQuantity_tokan().split(",");
						
						Float total_order_amount = 0f;
						
						for(int j=0; j<foodIdArr.length; j++ ) {
							
							String sql = "SELECT 	ft.Id, ft.Name, ft.Description, ft.Price, ft.CategoryId, ft.UserId, ft.Status, ct.name \r\n"
									+ "FROM fooditems ft LEFT JOIN item_categories_tb ct ON ct.id = ft.CategoryId WHERE ft.Id = ?;";
							// Select query for showing data on manage table
							PreparedStatement ps_item = db.connection.prepareStatement(sql);
							ps_item.setInt(1, Integer.parseInt(foodIdArr[j]));
							System.out.println(ps_item);
							ResultSet resultSet = ps_item.executeQuery();
							
							FoodDto f_dto =new FoodDto();
							
							while(resultSet.next()) {
								
								f_dto.setId(resultSet.getInt(1));
								f_dto.setName(resultSet.getString(2));
								f_dto.setDescription(resultSet.getString(3));
								f_dto.setPrice(resultSet.getFloat(4));
								f_dto.setCategory_id_fk(resultSet.getInt(5));
								f_dto.setUser_id_fk(resultSet.getInt(6));
								f_dto.setStatus(resultSet.getString(7));
								f_dto.setCategory_name(resultSet.getString(8));
								total_order_amount = total_order_amount + (f_dto.getPrice()*Float.parseFloat(foodQunatityArr[j]));
								
							}
							
							
							String sql_food_insert = "INSERT INTO orderitems ( OrderID, FoodID, NAME, Quantity, Price, Description) VALUES (?,?,?,?,?,?);";
							PreparedStatement ps_insert = db.connection.prepareStatement(sql_food_insert);
							ps_insert.setInt(1, generated_order_id);
							ps_insert.setInt(2, Integer.parseInt(foodIdArr[j]));
							ps_insert.setString(3, f_dto.getName());
							ps_insert.setFloat(4, Float.parseFloat(foodQunatityArr[j]));
							ps_insert.setFloat(5, f_dto.getPrice());
							ps_insert.setString(6, f_dto.getDescription());
							System.out.println(ps_insert);
							ps_insert.executeUpdate();
							
							
						}
						
						String sql_order_up = "UPDATE orders SET TotalAmount = ? WHERE Id = ? ;";
						PreparedStatement ps_order_update = db.connection.prepareStatement(sql_order_up);
						ps_order_update.setFloat(1, total_order_amount);
						ps_order_update.setInt(2, generated_order_id);
						System.out.println(ps_order_update);
						ps_order_update.executeUpdate();

						if (i != 0) {
							return true;
						}

					} catch (Exception e) {
						
						e.printStackTrace();
						
					}
					
					return false;
				}

				//Method for Show data on Manage page
					public ArrayList<OrderDto> getOrderInfo(ServletConfig config, HttpServletRequest request) throws IOException{
						
						DataDb db = new DataDb(request);
						PreparedStatement preparedStatement=null;
						
						ArrayList<OrderDto> list = new ArrayList<OrderDto>();
						
						try {
							
							String sql = "SELECT 	Id, CustomerID, CustName, CustMobile, TrainID, TrainNo, OrderDateTime,"
									+ " TotalAmount, PaidAmount, SheetNo, CoachNo, STATUS \r\n"
									+ "FROM orders ;";
							// Select query for showing data on manage table
							preparedStatement = db.connection.prepareStatement(sql);
							
							ResultSet resultSet = preparedStatement.executeQuery();
							
							while(resultSet.next()) {
								
								OrderDto dto =new OrderDto();
								
								dto.setId(resultSet.getInt(1));
								dto.setCustomerID(resultSet.getInt(2));
								dto.setCust_name(resultSet.getString(3));
								dto.setCust_mobile(resultSet.getString(4));
								dto.setTrainID(resultSet.getInt(5));
								dto.setTrainNumber(resultSet.getInt(6));
								dto.setOrderDateTime(resultSet.getString(7));
								dto.setTotalAmount(resultSet.getFloat(8));
								dto.setPaidAmount(resultSet.getFloat(9));
								dto.setSheetNo(resultSet.getInt(10));
								dto.setCoachNo(resultSet.getString(11));
								dto.setStatus(resultSet.getString(12));
								
								list.add(dto);
							}
						}
						catch (Exception e) {
							
						}
						finally {
							if (db.connection != null)
								try {
									db.connection.close();
								} catch (Exception e) {

								}
						}
						return list;
					}
					
					//Method for Show data on Manage page
					public ArrayList<OrderDto> getOrderInfoByCustId(int cust_id, ServletConfig config, HttpServletRequest request) throws IOException{
						
						DataDb db = new DataDb(request);
						PreparedStatement preparedStatement=null;
						
						ArrayList<OrderDto> list = new ArrayList<OrderDto>();
						
						try {
							String sql = "SELECT 	Id, CustomerID, CustName, CustMobile, TrainID, TrainNo, OrderDateTime,"
									+ " TotalAmount, PaidAmount, SheetNo, CoachNo, STATUS \r\n"
									+ "FROM orders WHERE CustomerID = ? ;";
							
							// Select query for showing data on manage table
							preparedStatement = db.connection.prepareStatement(sql);
							preparedStatement.setInt(1, cust_id);
							
							ResultSet resultSet = preparedStatement.executeQuery();
							
							while(resultSet.next()) {
								
								OrderDto dto =new OrderDto();
								
								dto.setId(resultSet.getInt(1));
								dto.setCustomerID(resultSet.getInt(2));
								dto.setCust_name(resultSet.getString(3));
								dto.setCust_mobile(resultSet.getString(4));
								dto.setTrainID(resultSet.getInt(5));
								dto.setTrainNumber(resultSet.getInt(6));
								dto.setOrderDateTime(resultSet.getString(7));
								dto.setTotalAmount(resultSet.getFloat(8));
								dto.setPaidAmount(resultSet.getFloat(9));
								dto.setSheetNo(resultSet.getInt(10));
								dto.setCoachNo(resultSet.getString(11));
								dto.setStatus(resultSet.getString(12));
								
								list.add(dto);
							}
						}
						catch (Exception e) {
							
						}
						finally {
							if (db.connection != null)
								try {
									db.connection.close();
								} catch (Exception e) {

								}
						}
						return list;
					}
					
					//Show data on edit page according to id
						public OrderDto getOrderInfoById(int id, ServletConfig config, HttpServletRequest request) throws IOException{
							
							DataDb db = new DataDb(request);
							PreparedStatement preparedStatement=null;
							
							OrderDto dto = new OrderDto();
							
							try {
								
								String sql = "SELECT 	Id, CustomerID, CustName, CustMobile, TrainID, TrainNo, OrderDateTime,"
										+ " TotalAmount, PaidAmount, SheetNo, CoachNo, STATUS \r\n"
										+ "FROM orders WHERE Id = ? ;";
								// Select query for showing data on Edit page
								preparedStatement = db.connection.prepareStatement(sql);
								
								preparedStatement.setInt(1, id);
								System.out.println(preparedStatement);
								ResultSet resultSet = preparedStatement.executeQuery();
								
								while(resultSet.next()) {
									dto.setId(resultSet.getInt(1));
									dto.setCustomerID(resultSet.getInt(2));
									dto.setCust_name(resultSet.getString(3));
									dto.setCust_mobile(resultSet.getString(4));
									dto.setTrainID(resultSet.getInt(5));
									dto.setTrainNumber(resultSet.getInt(6));
									dto.setOrderDateTime(resultSet.getString(7));
									dto.setTotalAmount(resultSet.getFloat(8));
									dto.setPaidAmount(resultSet.getFloat(9));
									dto.setSheetNo(resultSet.getInt(10));
									dto.setCoachNo(resultSet.getString(11));
									dto.setStatus(resultSet.getString(12));
									
								}
							}
							catch (Exception e) {
								
							}
							finally {
								if (db.connection != null)
									try {
										db.connection.close();
									} catch (Exception e) {

									}
							}
							return dto;
						}
						
						// Method For Updating data on edit page
						public boolean updateOrderInfo(OrderDto dto, HttpServletRequest request,
								ServletConfig config) throws IOException {
							
							DataDb db = new DataDb(request);
							PreparedStatement ps=null;
							
							try {
								
								String sql = "UPDATE orders SET Status = ?, PaidAmount = ?, Remark WHERE Id = ? ;";
								//Update Query for update data 
								ps = db.connection.prepareStatement(sql);

								ps.setString(1, dto.getStatus());
								ps.setFloat(2, dto.getPaidAmount());
								ps.setString(3, dto.getRemark());
								ps.setInt(4, dto.getId());

								System.out.println(ps);
								
								int i = ps.executeUpdate();
								
								if (i != 0) {
									return true;
								}
							} 
							catch (Exception e) {

								e.printStackTrace();
							}
							return false;
						}
						
						
						public ArrayList<OrderDto> getPendingOrderInfo(ServletConfig config, HttpServletRequest request) throws IOException{
							
							DataDb db = new DataDb(request);
							PreparedStatement preparedStatement=null;
							
							ArrayList<OrderDto> list = new ArrayList<OrderDto>();
							
							try {
								String sql = "SELECT 	Id, CustomerID, CustName, CustMobile, TrainID, TrainNo, OrderDateTime,"
										+ " TotalAmount, PaidAmount, SheetNo, CoachNo, STATUS \r\n"
										+ "FROM orders WHERE Status = 'Pending' ;";
								
								preparedStatement = db.connection.prepareStatement(sql);
								
								ResultSet resultSet = preparedStatement.executeQuery();
								
								while(resultSet.next()) {
									
									OrderDto dto =new OrderDto();
									
									dto.setId(resultSet.getInt(1));
									dto.setCustomerID(resultSet.getInt(2));
									dto.setCust_name(resultSet.getString(3));
									dto.setCust_mobile(resultSet.getString(4));
									dto.setTrainID(resultSet.getInt(5));
									dto.setTrainNumber(resultSet.getInt(6));
									dto.setOrderDateTime(resultSet.getString(7));
									dto.setTotalAmount(resultSet.getFloat(8));
									dto.setPaidAmount(resultSet.getFloat(9));
									dto.setSheetNo(resultSet.getInt(10));
									dto.setCoachNo(resultSet.getString(11));
									dto.setStatus(resultSet.getString(12));
									
									list.add(dto);
								}
							}
							catch (Exception e) {
								
							}
							finally {
								if (db.connection != null)
									try {
										db.connection.close();
									} catch (Exception e) {

									}
							}
							return list;
						}
						
						
						public ArrayList<OrderDto> getCompleteOrderInfo(ServletConfig config, HttpServletRequest request) throws IOException{
							
							DataDb db = new DataDb(request);
							PreparedStatement preparedStatement=null;
							
							ArrayList<OrderDto> list = new ArrayList<OrderDto>();
							
							try {
								String sql = "SELECT 	Id, CustomerID, CustName, CustMobile, TrainID, TrainNo, OrderDateTime,"
										+ " TotalAmount, PaidAmount, SheetNo, CoachNo, STATUS \r\n"
										+ "FROM orders WHERE Status = 'Complete' ;";
								
								preparedStatement = db.connection.prepareStatement(sql);
								
								ResultSet resultSet = preparedStatement.executeQuery();
								
								while(resultSet.next()) {
									
									OrderDto dto =new OrderDto();
									
									dto.setId(resultSet.getInt(1));
									dto.setCustomerID(resultSet.getInt(2));
									dto.setCust_name(resultSet.getString(3));
									dto.setCust_mobile(resultSet.getString(4));
									dto.setTrainID(resultSet.getInt(5));
									dto.setTrainNumber(resultSet.getInt(6));
									dto.setOrderDateTime(resultSet.getString(7));
									dto.setTotalAmount(resultSet.getFloat(8));
									dto.setPaidAmount(resultSet.getFloat(9));
									dto.setSheetNo(resultSet.getInt(10));
									dto.setCoachNo(resultSet.getString(11));
									dto.setStatus(resultSet.getString(12));
									
									list.add(dto);
								}
							}
							catch (Exception e) {
								
							}
							finally {
								if (db.connection != null)
									try {
										db.connection.close();
									} catch (Exception e) {

									}
							}
							return list;
						}
						
						
						public ArrayList<OrderDto> getFailedOrderInfo(ServletConfig config, HttpServletRequest request) throws IOException{
							
							DataDb db = new DataDb(request);
							PreparedStatement preparedStatement=null;
							
							ArrayList<OrderDto> list = new ArrayList<OrderDto>();
							
							try {
								String sql = "SELECT 	Id, CustomerID, CustName, CustMobile, TrainID, TrainNo, OrderDateTime,"
										+ " TotalAmount, PaidAmount, SheetNo, CoachNo, STATUS \r\n"
										+ "FROM orders WHERE Status = 'Failed' ;";
								
								preparedStatement = db.connection.prepareStatement(sql);
								
								ResultSet resultSet = preparedStatement.executeQuery();
								
								while(resultSet.next()) {
									
									OrderDto dto =new OrderDto();
									
									dto.setId(resultSet.getInt(1));
									dto.setCustomerID(resultSet.getInt(2));
									dto.setCust_name(resultSet.getString(3));
									dto.setCust_mobile(resultSet.getString(4));
									dto.setTrainID(resultSet.getInt(5));
									dto.setTrainNumber(resultSet.getInt(6));
									dto.setOrderDateTime(resultSet.getString(7));
									dto.setTotalAmount(resultSet.getFloat(8));
									dto.setPaidAmount(resultSet.getFloat(9));
									dto.setSheetNo(resultSet.getInt(10));
									dto.setCoachNo(resultSet.getString(11));
									dto.setStatus(resultSet.getString(12));
									
									list.add(dto);
								}
							}
							catch (Exception e) {
								
							}
							finally {
								if (db.connection != null)
									try {
										db.connection.close();
									} catch (Exception e) {

									}
							}
							return list;
						}
						
						
						//Method for Show data on Manage page
						public ArrayList<OrderItemDto> getOrderItemInfoByOrderId(int order_id ,ServletConfig config, HttpServletRequest request) throws IOException{
							
							DataDb db = new DataDb(request);
							PreparedStatement preparedStatement=null;
							
							ArrayList<OrderItemDto> list = new ArrayList<OrderItemDto>();
							
							try {
								
								String sql = "SELECT 	Id, OrderID, FoodID, NAME, Quantity, Price, Description FROM orderitems WHERE OrderID = ?;";
								// Select query for showing data on manage table
								preparedStatement = db.connection.prepareStatement(sql);
								preparedStatement.setInt(1, order_id);
								ResultSet resultSet = preparedStatement.executeQuery();
								
								while(resultSet.next()) {
									
									OrderItemDto dto =new OrderItemDto();
									
									dto.setId(resultSet.getInt(1));
									dto.setOrderID(resultSet.getInt(2));
									dto.setFoodID(resultSet.getInt(3));
									dto.setName(resultSet.getString(4));
									dto.setQuantity(resultSet.getFloat(5));
									dto.setPrice(resultSet.getFloat(6));
									dto.setDescription(resultSet.getString(7));
									list.add(dto);
								}
							}
							catch (Exception e) {
								
							}
							finally {
								if (db.connection != null)
									try {
										db.connection.close();
									} catch (Exception e) {

									}
							}
							return list;
						}
						
						// Method For Updating data on edit page
						public boolean updateOrder(OrderDto dto, HttpServletRequest request,
								ServletConfig config) throws IOException {
							
							DataDb db = new DataDb(request);
							PreparedStatement ps=null;
							
							try {
								
								String sql = "UPDATE orders SET PaidAmount = ? ,STATUS = ? , Remark = ? WHERE Id = ? ;";
								//Update Query for update data 
								ps = db.connection.prepareStatement(sql);

								ps.setFloat(1, dto.getPaidAmount());
								ps.setString(2, dto.getStatus());
								ps.setString(3, dto.getRemark());
								ps.setInt(4, dto.getId());

								System.out.println(ps);
								
								int i = ps.executeUpdate();
								
								if (i != 0) {
									return true;
								}
							} 
							catch (Exception e) {

								e.printStackTrace();
							}
							return false;
						}
						
						
}
