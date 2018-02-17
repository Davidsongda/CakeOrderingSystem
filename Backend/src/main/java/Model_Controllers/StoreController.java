package Model_Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(path="/stores")
public class StoreController {

    @Autowired
    private StoreRepository storeRepository;

    @RequestMapping(method=RequestMethod.GET)
    public Iterable<Store> getAll() {
        return storeRepository.findAll();
    }
}
