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
    
    public DefaultTableModel getEmployeeTable(String selected){
        String query = "select * from Employee;";
        if(selected.equals("active employees"))
            query = "select * from Employee where isActive = 1;";
        else if(selected.equals("inactive employees"))
            query = "select * from Employee where isActive = 0;";
        return dao.queryTable(query);
    }
    
    public DefaultTableModel getLocationTable(){
        String query = "select * from Location;";
        return dao.queryTable(query);
    }
    
    public DefaultTableModel getBankTable(String selected){
        String query = "select * from Bank;";
        if(selected.equals("with accounts"))
            query = "select name, branch, completeAddress from Bank, Account, Address where Bank.idBank = Account.idBank and Bank.idBank = Address.idOwner;";
        else if(selected.equals("with active accounts"))
            query = "select name, branch, completeAddress from Bank, Account, Address, Assignment where Bank.idBank = Account.idBank and Bank.idBank = Address.idOwner and Assignment.idAccount = Account.idAccount;";
        else if(selected.equals("without accounts"))
            query = "select name, branch, completeAddress from Bank, Address where Bank.idBank = Address.idOwner and idBank not in (select Bank.idBank from Bank, Account, Address where Bank.idBank = Account.idBank and Bank.idBank = Address.idOwner);";
        else if(selected.equals("without active accounts"))
            query = "select name, branch, completeAddress from Bank, Address where Bank.idBank = Address.idOwner and idBank not in (select Bank.idBank from Bank, Account, Address, Assignment where Bank.idBank = Account.idBank and Bank.idBank = Address.idOwner and Assignment.idAccount = Account.idAccount);";
        return dao.queryTable(query);
    }
    
    public DefaultTableModel getAccountTable(String selected){
        String query = "select Bank.name, Vehicle.color, Vehicle.model, Vehicle.year, PersonInterest.name from Account, Bank, Vehicle, PersonInterest where Account.idBank = Bank.idBank and Account.idAccount = Vehicle.idAccount and Account.idAccount = PersonInterest.idAccount;";
        if(selected.equals("handled active accounts"))
            query = "select Bank.name, Vehicle.color, Vehicle.model, Vehicle.year, PersonInterest.name from Account, Bank, Vehicle, PersonInterest, Assignment where Account.idBank = Bank.idBank and Account.idAccount = Vehicle.idAccount and Account.idAccount = PersonInterest.idAccount and Assignment.idAccount = Account.idAccount;";
        else if(selected.equals("unhandled active accounts"))
            query = "select Bank.name, Vehicle.color, Vehicle.model, Vehicle.year, PersonInterest.name from Account, Bank, Vehicle, PersonInterest, Assignment where Account.idBank = Bank.idBank and Account.idAccount = Vehicle.idAccount and Account.idAccount = PersonInterest.idAccount and Account.idAccount not in (select Assignment.idAccount from Assignment);";
        else if(selected.equals("resolved accounts"))
            query = "select Bank.name, Vehicle.model, Vehicle.year, PersonInterest.name from Account, Bank, Vehicle, PersonInterest where Account.idBank = Bank.idBank and Account.idAccount = Vehicle.idAccount and Account.idAccount = PersonInterest.idAccount and Account.isResolved = 1;";
        else if(selected.equals("unresolved accounts"))
            query = "select Bank.name, Vehicle.model, Vehicle.year, PersonInterest.name from Account, Bank, Vehicle, PersonInterest where Account.idBank = Bank.idBank and Account.idAccount = Vehicle.idAccount and Account.idAccount = PersonInterest.idAccount and Account.isResolved = 0;";
        return dao.queryTable(query);
    }
    
    public DefaultTableModel getAccountBankTable(String selected, String bankId, int employeeId){
        String query = "select Vehicle.color, Vehicle.model, Vehicle.year, PersonInterest.name, type,  contactInfo from Account, Bank, Vehicle, PersonInterest, ContactInfo, Assignment where Account.idBank = Bank.idBank and Account.idAccount = Vehicle.idAccount and Account.idAccount = PersonInterest.idAccount and idPersonInterest = ContactInfo.idOwner and Assignment.idAccount = Account.idAccount and Assignment.idEmployee = "+employeeId+" and Bank.idBank = "+bankId+";";
        if(selected.equals("unresolved accounts"))
            query = "select Vehicle.color, Vehicle.model, Vehicle.year, PersonInterest.name, type,  contactInfo from Account, Bank, Vehicle, PersonInterest, ContactInfo, Assignment where Account.idBank = Bank.idBank and Account.idAccount = Vehicle.idAccount and Account.idAccount = PersonInterest.idAccount and idPersonInterest = ContactInfo.idOwner and Assignment.idAccount = Account.idAccount and Assignment.idEmployee = "+employeeId+" and Bank.idBank = "+bankId+" and Account.isResolved = 0;";
        if(selected.equals("resolved accounts"))
            query = "select Vehicle.color, Vehicle.model, Vehicle.year, PersonInterest.name, type,  contactInfo from Account, Bank, Vehicle, PersonInterest, ContactInfo, Assignment where Account.idBank = Bank.idBank and Account.idAccount = Vehicle.idAccount and Account.idAccount = PersonInterest.idAccount and idPersonInterest = ContactInfo.idOwner and Assignment.idAccount = Account.idAccount and Assignment.idEmployee = "+employeeId+" and Bank.idBank = "+bankId+" and Account.isResolved = 1;";
        return dao.queryTable(query);
    }
}
