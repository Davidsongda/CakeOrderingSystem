package Model_Controllers;

import javax.persistence.*;
import java.util.Date;
import java.util.HashMap;

@Entity
public class Cake {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private long cake_id;

    HashMap<String, String> cake_Info;


    private long store_id;

    public void setCake_id(long id) {
        this.cake_id = id;
    }

    public long getCake_id() {
        return this.cake_id;
    }

    public void setCake_Info(HashMap<String, String> info) {
        this.cake_Info = info;
    }

    public HashMap<String, String> getCake_Info () {
        return this.cake_Info;
    }

    public void setStore_id(long id) {
        this.store_id = id;
    }
    public long getStore_id() {
        return this.store_id;
    }
}