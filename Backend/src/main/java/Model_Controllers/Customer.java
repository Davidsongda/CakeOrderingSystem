package Model_Controllers;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity // This tells Hibernate to make a table out of this class
public class Customer {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private long customer_id;

    private String first_name;

    private String last_name;

    private String email;

    private String phone_number;


    public void setCustomer_id(Long id) {
        this.customer_id = id;
    }

    public String getFirst_name() {
        return first_name;
    }

    public void setFirst_name(String name) {
        this.first_name = name;
    }

    public String getLast_name() {return last_name; }

    public void setLast_name(String last) { this.last_name = last;}

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone_number() {return phone_number; }

    public void setPhone_number(String phone) {this.phone_number = phone;}
}
