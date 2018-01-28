/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package convergentsw.gui;

import javax.swing.ImageIcon;

/**
 *
 * @author jonats
 */
public class PnlAdmin extends javax.swing.JPanel {

    /**
     * Creates new form PnlAdmin
     */
    public PnlAdmin() {
        initComponents();
        ImageIcon icon = new ImageIcon();
        jTabbedPane1.addTab("Accounts", icon, new PnlTabAccounts(), "manage accounts");
        jTabbedPane1.addTab("Banks", icon, new PnlTabBanks(), "manage banks");
        jTabbedPane1.addTab("Locations", icon, new PnlTabLocations(), "manage locations");
        jTabbedPane1.addTab("Employees", icon, new PnlTabEmployees(), "manage employees");
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jTabbedPane1 = new javax.swing.JTabbedPane();

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jTabbedPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 400, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jTabbedPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 300, Short.MAX_VALUE)
        );
    }// </editor-fold>//GEN-END:initComponents


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JTabbedPane jTabbedPane1;
    // End of variables declaration//GEN-END:variables
}
