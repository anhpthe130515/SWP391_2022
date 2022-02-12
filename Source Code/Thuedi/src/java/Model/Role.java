/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author Admin
 */
public enum Role {
        ADMIN(1),
        USER(2),
        LANDLORD(3);

        private final int id;

        Role(final int newValue) {
            id = newValue;
        }

        public int getId() { return id; }
}
