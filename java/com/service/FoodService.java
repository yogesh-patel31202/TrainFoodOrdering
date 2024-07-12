package com.service;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServletRequest;

import com.db.DataDb;
import com.dto.FoodDto;

public class FoodService {
	



	// Insert Method for Category Item
				public boolean insertFood(FoodDto dto, HttpServletRequest request, ServletConfig config) throws IOException {
					
					DataDb db = new DataDb(request);
					
					try {
						
						//Insert Query of PathologyItem
						
						PreparedStatement ps = db.connection.prepareStatement("INSERT INTO fooditems (NAME, Description, Price, CategoryId, UserId)\r\n"
								+ "VALUES(?,?,?,?,?);");

						ps.setString(1, dto.getName());
						ps.setString(2, dto.getDescription());
						ps.setFloat(3, dto.getPrice());
						ps.setInt(4, dto.getCategory_id_fk());
						ps.setInt(5, dto.getUser_id_fk());
						

						System.out.println(ps);

						int i = ps.executeUpdate();

						if (i != 0) {
							return true;
						}

					} catch (Exception e) {
						
						e.printStackTrace();
						
					}
					
					return false;
				}

				//Method for Show data on Manage page
					public ArrayList<FoodDto> getFoodInfo(ServletConfig config, HttpServletRequest request) throws IOException{
						
						DataDb db = new DataDb(request);
						PreparedStatement preparedStatement=null;
						
						ArrayList<FoodDto> list = new ArrayList<FoodDto>();
						
						try {
							
							String sql = "SELECT 	ft.Id, ft.Name, ft.Description, ft.Price, ft.CategoryId, ft.UserId, ft.Status, ct.name\r\n"
									+ "FROM fooditems ft LEFT JOIN item_categories_tb ct ON ct.id = ft.CategoryId;";
							// Select query for showing data on manage table
							preparedStatement = db.connection.prepareStatement(sql);
							
							ResultSet resultSet = preparedStatement.executeQuery();
							
							while(resultSet.next()) {
								
								FoodDto dto =new FoodDto();
								
								dto.setId(resultSet.getInt(1));
								dto.setName(resultSet.getString(2));
								dto.setDescription(resultSet.getString(3));
								dto.setPrice(resultSet.getFloat(4));
								dto.setCategory_id_fk(resultSet.getInt(5));
								dto.setUser_id_fk(resultSet.getInt(6));
								dto.setStatus(resultSet.getString(7));
								dto.setCategory_name(resultSet.getString(8));
								
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
					public ArrayList<FoodDto> getFoodInfoByCategoryId(int cat_id, ServletConfig config, HttpServletRequest request) throws IOException{
						
						DataDb db = new DataDb(request);
						PreparedStatement preparedStatement=null;
						
						ArrayList<FoodDto> list = new ArrayList<FoodDto>();
						
						try {
							
							String sql = "SELECT 	ft.Id, ft.Name, ft.Description, ft.Price, ft.CategoryId, ft.UserId, ft.Status, ct.name\r\n"
									+ "FROM fooditems ft LEFT JOIN item_categories_tb ct ON ct.id = ft.CategoryId WHERE ft.CategoryId = ?;";
							// Select query for showing data on manage table
							preparedStatement = db.connection.prepareStatement(sql);
							preparedStatement.setInt(1, cat_id);
							
							ResultSet resultSet = preparedStatement.executeQuery();
							
							while(resultSet.next()) {
								
								FoodDto dto =new FoodDto();
								
								dto.setId(resultSet.getInt(1));
								dto.setName(resultSet.getString(2));
								dto.setDescription(resultSet.getString(3));
								dto.setPrice(resultSet.getFloat(4));
								dto.setCategory_id_fk(resultSet.getInt(5));
								dto.setUser_id_fk(resultSet.getInt(6));
								dto.setStatus(resultSet.getString(7));
								dto.setCategory_name(resultSet.getString(8));
								
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
						public FoodDto getFoodInfoById(int id, ServletConfig config, HttpServletRequest request) throws IOException{
							
							DataDb db = new DataDb(request);
							PreparedStatement preparedStatement=null;
							
							FoodDto dto = new FoodDto();
							
							try {
								
								String sql = "SELECT 	ft.Id, ft.Name, ft.Description, ft.Price, ft.CategoryId, ft.UserId, ft.Status, ct.name\r\n"
										+ "FROM fooditems ft LEFT JOIN item_categories_tb ct ON ct.id = ft.CategoryId WHERE ft.Id = ?;";
								// Select query for showing data on Edit page
								preparedStatement = db.connection.prepareStatement(sql);
								
								preparedStatement.setInt(1, id);
								
								ResultSet resultSet = preparedStatement.executeQuery();
								
								while(resultSet.next()) {
									dto.setId(resultSet.getInt(1));
									dto.setName(resultSet.getString(2));
									dto.setDescription(resultSet.getString(3));
									dto.setPrice(resultSet.getFloat(4));
									dto.setCategory_id_fk(resultSet.getInt(5));
									dto.setUser_id_fk(resultSet.getInt(6));
									dto.setStatus(resultSet.getString(7));
									dto.setCategory_name(resultSet.getString(8));
									
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
						public boolean updateFoodInfo(FoodDto dto, HttpServletRequest request,
								ServletConfig config) throws IOException {
							
							DataDb db = new DataDb(request);
							PreparedStatement ps=null;
							
							try {
								
								String sql = "UPDATE fooditems SET NAME = ?, Description = ? , Price = ? , CategoryId = ?, UserId = ? , STATUS = ?\r\n"
										+ "WHERE Id = ? ;";
								//Update Query for update data 
								ps = db.connection.prepareStatement(sql);

								ps.setString(1, dto.getName());
								ps.setString(2, dto.getDescription());
								ps.setFloat(3, dto.getPrice());
								ps.setInt(4, dto.getCategory_id_fk());
								ps.setInt(5, dto.getUser_id_fk());
								ps.setString(6, dto.getStatus());
								ps.setInt(7, dto.getId());

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
						
						
						public ArrayList<FoodDto> getActiveFoodInfo(ServletConfig config, HttpServletRequest request) throws IOException{
							
							DataDb db = new DataDb(request);
							PreparedStatement preparedStatement=null;
							
							ArrayList<FoodDto> list = new ArrayList<FoodDto>();
							
							try {
								String sql = "SELECT 	ft.Id, ft.Name, ft.Description, ft.Price, ft.CategoryId, ft.UserId, ft.Status, ct.name\r\n"
										+ "FROM fooditems ft LEFT JOIN item_categories_tb ct ON ct.id = ft.CategoryId WHERE Status='Active'; ;";
								
								preparedStatement = db.connection.prepareStatement(sql);
								
								ResultSet resultSet = preparedStatement.executeQuery();
								
								while(resultSet.next()) {
									
									FoodDto dto =new FoodDto();
									
									dto.setId(resultSet.getInt(1));
									dto.setName(resultSet.getString(2));
									dto.setDescription(resultSet.getString(3));
									dto.setPrice(resultSet.getFloat(4));
									dto.setCategory_id_fk(resultSet.getInt(5));
									dto.setUser_id_fk(resultSet.getInt(6));
									dto.setStatus(resultSet.getString(7));
									dto.setCategory_name(resultSet.getString(8));
									
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
}
