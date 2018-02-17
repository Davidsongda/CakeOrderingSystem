package Model_Controllers;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

public interface CakeRepository extends CrudRepository<Cake, Long>{
    @Query("select cake from Cake cake where cake.store_id=:storeID")
    public Iterable<Cake> findByStore(@Param("storeID") long storeID);
}
