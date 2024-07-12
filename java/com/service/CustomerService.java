package com.service;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServletRequest;

import com.db.DataDb;
import com.dto.CustomerDto;

public class CustomerService {
	



	// Insert Method for Category Item
				public boolean insertCustomer(CustomerDto dto, HttpServletRequest request, ServletConfig config) throws IOException {
					
					DataDb db = new DataDb(request);
					
					try {
						
						//Insert Query of PathologyItem
						
						PreparedStatement ps = db.connection.prepareStatement("INSERT INTO customers (NAME, Email, Mobile, Address, PASSWORD)\r\n"
								+ "VALUES(?,?,?,?,?);");

						ps.setString(1, dto.getName());
						ps.setString(2, dto.getEmail());
						ps.setString(3, dto.getMobile());
						ps.setString(4, dto.getAddress());
						ps.setString(5, dto.getPassword());
						

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
					public ArrayList<CustomerDto> getCustomerInfo(ServletConfig config, HttpServletRequest request) throws IOException{
						
						DataDb db = new DataDb(request);
						PreparedStatement preparedStatement=null;
						
						ArrayList<CustomerDto> list = new ArrayList<CustomerDto>();
						
						try {
							
							String sql = "SELECT 	ID, NAME, Email, Mobile, Address, PASSWORD, current_in_date , Status FROM customers;";
							// Select query for showing data on manage table
							preparedStatement = db.connection.prepareStatement(sql);
							
							ResultSet resultSet = preparedStatement.executeQuery();
							
							while(resultSet.next()) {
								
								CustomerDto dto =new CustomerDto();
								
								dto.setId(resultSet.getInt(1));
								dto.setName(resultSet.getString(2));
								dto.setEmail(resultSet.getString(3));
								dto.setMobile(resultSet.getString(4));
								dto.setAddress(resultSet.getString(5));
								dto.setPassword(resultSet.getString(6));
								dto.setCurrent_in_date(resultSet.getString(7));
								dto.setStatus(resultSet.getString(8));
								
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
						public CustomerDto getCustomerInfoById(int id, ServletConfig config, HttpServletRequest request) throws IOException{
							
							DataDb db = new DataDb(request);
							PreparedStatement preparedStatement=null;
							
							CustomerDto dto = new CustomerDto();
							
							try {
								String sql = "SELECT 	ID, NAME, Email, Mobile, Address, PASSWORD, current_in_date FROM customers WHERE Id = ?;";
								
								preparedStatement = db.connection.prepareStatement(sql);
								
								preparedStatement.setInt(1, id);
								
								ResultSet resultSet = preparedStatement.executeQuery();
								
								while(resultSet.next()) {
									dto.setId(resultSet.getInt(1));
									dto.setName(resultSet.getString(2));
									dto.setEmail(resultSet.getString(3));
									dto.setMobile(resultSet.getString(4));
									dto.setAddress(resultSet.getString(5));
									dto.setPassword(resultSet.getString(6));
									dto.setCurrent_in_date(resultSet.getString(7));
									
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
						public boolean updateCustomerInfo(CustomerDto dto,String new_password, HttpServletRequest request,
								ServletConfig config) throws IOException {
							
							DataDb db = new DataDb(request);
							PreparedStatement ps=null;
							
							try {
								String old_password = "";
								String sql_select = "SELECT 	PASSWORD FROM customers WHERE Id = ?;";
								PreparedStatement preparedStatement = db.connection.prepareStatement(sql_select);
								preparedStatement.setInt(1, dto.getId());
								ResultSet resultSet = preparedStatement.executeQuery();
								
								while(resultSet.next()) {
									old_password = resultSet.getString(1);
								}
								
								if(dto.getPassword().equalsIgnoreCase(old_password)) {
								
								String sql = "UPDATE customers SET NAME = ? , Email = ? , Address = ? , PASSWORD = ? WHERE ID = ? ;";
								//Update Query for update data 
								ps = db.connection.prepareStatement(sql);

								ps.setString(1, dto.getName());
								ps.setString(2, dto.getEmail());
								ps.setString(3, dto.getAddress());
								ps.setString(4, new_password);
								ps.setInt(5, dto.getId());

								System.out.println(ps);
								
								int i = ps.executeUpdate();
								
								if (i != 0) {
									return true;
								}
								}
							} 
							catch (Exception e) {

								e.printStackTrace();
							}
							return false;
						}
						
						
						public ArrayList<CustomerDto> getBlockedCustomerInfo(ServletConfig config, HttpServletRequest request) throws IOException{
							
							DataDb db = new DataDb(request);
							PreparedStatement preparedStatement=null;
							
							ArrayList<CustomerDto> list = new ArrayList<CustomerDto>();
							
							try {
								
								String sql = "SELECT 	ID, NAME, Email, Mobile, Address, PASSWORD, current_in_date FROM customers WHERE Status='Block';";
								
								preparedStatement = db.connection.prepareStatement(sql);
								
								ResultSet resultSet = preparedStatement.executeQuery();
								
								while(resultSet.next()) {
									
									CustomerDto dto =new CustomerDto();
									
									dto.setId(resultSet.getInt(1));
									dto.setName(resultSet.getString(2));
									dto.setEmail(resultSet.getString(3));
									dto.setMobile(resultSet.getString(4));
									dto.setAddress(resultSet.getString(5));
									dto.setPassword(resultSet.getString(6));
									dto.setCurrent_in_date(resultSet.getString(7));
									
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
						
						public String checkLogin(CustomerDto dto, ServletConfig config, HttpServletRequest request) throws IOException {
							try {

								DataDb db = new DataDb(request);
								String sql = "SELECT id FROM customers WHERE Mobile= ? && PASSWORD= ? ;";

								PreparedStatement preparedStatement = db.connection.prepareStatement(sql);

								preparedStatement.setString(1, dto.getMobile());
								preparedStatement.setString(2, dto.getPassword());
								System.out.print(preparedStatement);

								ResultSet rs = preparedStatement.executeQuery();

								if (rs.next()) {
									return rs.getString(1);
								} else {
									return "0";
								}

							} catch (Exception e) {
								// LogFileService.catchLogFile(e, config);
								return "0";
							}
						}
						
						
}
