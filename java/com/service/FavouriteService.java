package com.service;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServletRequest;

import com.db.DataDb;
import com.dto.FavouriteDto;
import com.dto.ItemCategoryDto;

public class FavouriteService {
	

	// Insert Method for Category Item
				public boolean insertFavourite(FavouriteDto dto, HttpServletRequest request, ServletConfig config) throws IOException {
					
					DataDb db = new DataDb(request);
					
					try {
						
						//Insert Query of PathologyItem
						
						PreparedStatement ps = db.connection.prepareStatement("INSERT INTO favourite (CustomerId, FoodId) VALUES (?,?);");

						ps.setInt(1, dto.getCustomer_id());
						ps.setInt(2, dto.getFood_id());
						

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
				
				public boolean deleteFavourite(FavouriteDto dto, HttpServletRequest request, ServletConfig config) throws IOException {
					
					DataDb db = new DataDb(request);
					
					try {
						
						//Insert Query of PathologyItem
						
						PreparedStatement ps = db.connection.prepareStatement("DELETE FROM favourite WHERE CustomerId = ? AND FoodId = ?;");

						ps.setInt(1, dto.getCustomer_id());
						ps.setInt(2, dto.getFood_id());
						

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
					public ArrayList<FavouriteDto> getFavouriteInfo(ServletConfig config, HttpServletRequest request) throws IOException{
						
						DataDb db = new DataDb(request);
						PreparedStatement preparedStatement=null;
						
						ArrayList<FavouriteDto> list = new ArrayList<FavouriteDto>();
						
						try {
							
							String sql = "SELECT 	CustomerId, FoodId FROM favourite;";
							// Select query for showing data on manage table
							preparedStatement = db.connection.prepareStatement(sql);
							
							ResultSet resultSet = preparedStatement.executeQuery();
							
							while(resultSet.next()) {
								
								FavouriteDto dto =new FavouriteDto();
								
								dto.setCustomer_id(resultSet.getInt(1));
								dto.setFood_id(resultSet.getInt(2));
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
					public ArrayList<FavouriteDto> getFavouriteInfoByCustomer(int cust_id, ServletConfig config, HttpServletRequest request) throws IOException{
						
						DataDb db = new DataDb(request);
						PreparedStatement preparedStatement=null;
						
						ArrayList<FavouriteDto> list = new ArrayList<FavouriteDto>();
						
						try {
							
							String sql = "SELECT  CustomerId, FoodId FROM favourite WHERE CustomerId = ?;";
							// Select query for showing data on manage table
							preparedStatement = db.connection.prepareStatement(sql);
							preparedStatement.setInt(1, cust_id);
							ResultSet resultSet = preparedStatement.executeQuery();
							
							while(resultSet.next()) {
								
								FavouriteDto dto =new FavouriteDto();
								dto.setCustomer_id(resultSet.getInt(1));
								dto.setFood_id(resultSet.getInt(2));
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
					public boolean checkCustomerFavourite(int cust_id,int food_id,ServletConfig config, HttpServletRequest request) throws IOException{
						
						DataDb db = new DataDb(request);
						PreparedStatement preparedStatement=null;
						boolean result = false;
						try {
							
							String sql = "SELECT 	CustomerId, FoodId FROM favourite WHERE CustomerId= ? AND FoodId =?;";
							// Select query for showing data on manage table
							preparedStatement = db.connection.prepareStatement(sql);
							preparedStatement.setInt(1, cust_id);
							preparedStatement.setInt(2, food_id);
							//System.out.println(preparedStatement);
							ResultSet resultSet = preparedStatement.executeQuery();
							
							
							while(resultSet.next()) {
								result = true;
								return result;
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
						return result;
					}
					
				
}
