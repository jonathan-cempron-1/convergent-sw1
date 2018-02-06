/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package convergentsw.starter;
import  convergentsw.gui.*;
import convergentsw.dao.*;
/**
 *
 * @author jonats
 */
public class RuntimeData {
    public int loggedUserID = 0;
    public ConvergentDbDao cdd = new ConvergentDbDao();
    
    public RuntimeData(){
        new FrmLogin(this);
    }
}
