/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package convergentsw.dao;
import  convergentsw.gui.*;
import convergentsw.starter.*;
import javax.swing.table.*;
import java.sql.*;
import java.text.*;
import java.util.*;

/**
 *
 * @author jonats
 */
public class ConvergentDbDao {
    
    String url = "jdbc:mysql://localhost:3306/convergentDb2";
    String user = "root";
    String pass = "abc123";
    GenericDao dao = new GenericDao(url, user, pass);
    
    public boolean isValidEmployeeLogin(String username, String password){
        String query = "select * from Employee where isActive = 1;";
        ResultSet rs = dao.queryDb(query);
        try{
            while(rs.next()) {
                if(rs.getString("username").equals(username) && rs.getString("password").equals(password))
                    return true;
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return false;
    }
    
    public int getEmployeeId(String username, String password){
        int ret = 0;
        String query = "select * from Employee where username = '"+username+"' and password = '"+password+"';";
        ResultSet rs = dao.queryDb(query);
        try{
            rs.next();
            ret = rs.getInt("idEmployee");
        }catch(Exception e){
            e.printStackTrace();
        }
        return ret;
    }
    
    public boolean isAdminEmployee(int employeeId){
        String query = "select * from Employee where idEmployee = '"+employeeId+"';";
        ResultSet rs = dao.queryDb(query);
        try{
            rs.next();
            if(rs.getInt("adminPrivilege") == 1)
                return true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return false;
    }
    
    public String getEmployeeName(int employeeId){
        String query = "select * from Employee where idEmployee = '"+employeeId+"';";
        ResultSet rs = dao.queryDb(query);
        try{
            rs.next();
            return rs.getString("name");
        }catch(Exception e){
            e.printStackTrace();
        }
        return "";
    }
}
