package com.service;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServletRequest;

import com.db.DataDb;
import com.dto.TrainDto;

public class TrainService {
	



	// Insert Method for Category Item
				public boolean insertTrain(TrainDto dto, HttpServletRequest request, ServletConfig config) throws IOException {
					
					DataDb db = new DataDb(request);
					
					try {
						
						//Insert Query of PathologyItem
						
						PreparedStatement ps = db.connection.prepareStatement("INSERT INTO trains (TrainNumber, DepartureStation, ArrivalStation, DepartureTime, ArrivalTime,UserId)\r\n"
								+ "VALUES (?,?,?,?,?,?);");

						ps.setInt(1, dto.getTrainNumber());
						ps.setString(2, dto.getDepartureStation());
						ps.setString(3, dto.getArrivalStation());
						ps.setString(4, dto.getDepartureTime());
						ps.setString(5, dto.getArrivalTime());
						ps.setInt(6, dto.getUser_id_fk());
						

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
					public ArrayList<TrainDto> getTrainInfo(ServletConfig config, HttpServletRequest request) throws IOException{
						
						DataDb db = new DataDb(request);
						PreparedStatement preparedStatement=null;
						
						ArrayList<TrainDto> list = new ArrayList<TrainDto>();
						
						try {
							
							String sql = "SELECT 	Id, TrainNumber, DepartureStation, ArrivalStation, DepartureTime, ArrivalTime, Status, UserId	 \r\n"
									+ "FROM trains;";
							// Select query for showing data on manage table
							preparedStatement = db.connection.prepareStatement(sql);
							
							ResultSet resultSet = preparedStatement.executeQuery();
							
							while(resultSet.next()) {
								
								TrainDto dto =new TrainDto();
								
								dto.setId(resultSet.getInt(1));
								dto.setTrainNumber(resultSet.getInt(2));
								dto.setDepartureStation(resultSet.getString(3));
								dto.setArrivalStation(resultSet.getString(4));
								dto.setDepartureTime(resultSet.getString(5));
								dto.setArrivalTime(resultSet.getString(6));
								dto.setStatus(resultSet.getString(7));
								dto.setUser_id_fk(resultSet.getInt(8));
								
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
						public TrainDto getTrainInfoById(int id, ServletConfig config, HttpServletRequest request) throws IOException{
							
							DataDb db = new DataDb(request);
							PreparedStatement preparedStatement=null;
							
							TrainDto dto = new TrainDto();
							
							try {
								
								String sql = "SELECT 	Id, TrainNumber, DepartureStation, ArrivalStation, DepartureTime, ArrivalTime, Status, UserId	 \r\n"
										+ "FROM trains WHERE Id = ?;";
								// Select query for showing data on Edit page
								preparedStatement = db.connection.prepareStatement(sql);
								
								preparedStatement.setInt(1, id);
								
								ResultSet resultSet = preparedStatement.executeQuery();
								
								while(resultSet.next()) {
									dto.setId(resultSet.getInt(1));
									dto.setTrainNumber(resultSet.getInt(2));
									dto.setDepartureStation(resultSet.getString(3));
									dto.setArrivalStation(resultSet.getString(4));
									dto.setDepartureTime(resultSet.getString(5));
									dto.setArrivalTime(resultSet.getString(6));
									dto.setStatus(resultSet.getString(7));
									dto.setUser_id_fk(resultSet.getInt(8));
									
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
						public boolean updateTrainInfo(TrainDto dto, HttpServletRequest request,
								ServletConfig config) throws IOException {
							
							DataDb db = new DataDb(request);
							PreparedStatement ps=null;
							
							try {
								
								String sql = "UPDATE trains SET TrainNumber = ? , DepartureStation = ?, ArrivalStation = ? , DepartureTime = ? , ArrivalTime = ? , UserId = ? , \r\n"
										+ "STATUS = ? WHERE Id = ? ;";
								//Update Query for update data 
								ps = db.connection.prepareStatement(sql);

								ps.setInt(1, dto.getTrainNumber());
								ps.setString(2, dto.getDepartureStation());
								ps.setString(3, dto.getArrivalStation());
								ps.setString(4, dto.getDepartureTime());
								ps.setString(5, dto.getArrivalTime());
								ps.setInt(6, dto.getUser_id_fk());
								ps.setString(7, dto.getStatus());
								ps.setInt(8, dto.getId());

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
						
						
						public ArrayList<TrainDto> getActiveTrainInfo(ServletConfig config, HttpServletRequest request) throws IOException{
							
							DataDb db = new DataDb(request);
							PreparedStatement preparedStatement=null;
							
							ArrayList<TrainDto> list = new ArrayList<TrainDto>();
							
							try {
								String sql = "SELECT 	Id, TrainNumber, DepartureStation, ArrivalStation, DepartureTime, ArrivalTime, Status, UserId	 \r\n"
										+ "FROM trains WHERE Status='Active';";
								
								preparedStatement = db.connection.prepareStatement(sql);
								
								ResultSet resultSet = preparedStatement.executeQuery();
								
								while(resultSet.next()) {
									
									TrainDto dto =new TrainDto();
									
									dto.setId(resultSet.getInt(1));
									dto.setTrainNumber(resultSet.getInt(2));
									dto.setDepartureStation(resultSet.getString(3));
									dto.setArrivalStation(resultSet.getString(4));
									dto.setDepartureTime(resultSet.getString(5));
									dto.setArrivalTime(resultSet.getString(6));
									dto.setStatus(resultSet.getString(7));
									dto.setUser_id_fk(resultSet.getInt(8));
									
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
