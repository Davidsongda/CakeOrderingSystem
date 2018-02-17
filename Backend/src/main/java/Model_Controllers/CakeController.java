package Model_Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller    // This means that this class is a Controller
@RequestMapping(path="/cakes") // This means URL's start with /cake_controller (after Application path)
public class CakeController {
    @Autowired
    private CakeRepository cakeRepository;

    @RequestMapping(method = RequestMethod.GET)
    public @ResponseBody
    Iterable<Cake> getAllStores() {
        return cakeRepository.findAll();
    }

    @RequestMapping(method = RequestMethod.POST)
    public @ResponseBody String addNewCake(@RequestBody Cake cake) {
        Cake c = new Cake();
        c.setCake_id(cake.getCake_id());
        c.setCake_Info(cake.getCake_Info());
        c.setStore_id(cake.getStore_id());
        return "saved";
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public @ResponseBody Cake findCakerByID(@PathVariable("id") long id) {
        return cakeRepository.findOne(id);
    }

    @RequestMapping(value="/byStore/{id}", method = RequestMethod.GET)
    public @ResponseBody Iterable<Cake> findCakesByStore(@PathVariable("id") long store_id) {
        return cakeRepository.findByStore(store_id);
    }
}