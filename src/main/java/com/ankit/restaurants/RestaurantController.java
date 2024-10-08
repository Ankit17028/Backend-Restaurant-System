package com.ankit.restaurants;

import com.ankit.restaurants.model.MenuItem;
import com.ankit.restaurants.model.Restaurant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.NoSuchElementException;
import java.util.stream.StreamSupport;



@Controller
@RequestMapping("/restaurants")
public class RestaurantController {

  private final RestaurantRepository restaurantRepository;

  @Autowired
  public RestaurantController(RestaurantRepository restaurantRepository) {
    this.restaurantRepository = restaurantRepository;
  }

  @GetMapping("/{id}")
  public String viewRestaurant(@PathVariable("id")Long id, Model model) {
    var restaurant = restaurantRepository.findById(id).orElseThrow();
    model.addAttribute("restaurant", restaurant);
    return "restaurant-view";
  }

  @GetMapping("/create")
  public String viewCreateRestaurant(Model model) {
    model.addAttribute("restaurant", new Restaurant());
    return "create-restaurant-view";
  }

  @PostMapping("/save")
  public String saveRestaurant(@ModelAttribute Restaurant restaurant, Model model) {
    var savedRestaurant = restaurantRepository.save(restaurant);
    model.addAttribute("restaurant", savedRestaurant);
    return "restaurant-view";
  }

  @GetMapping("/{id}/create-menu-item")
  public String viewCreateMenuItem(@PathVariable("id") Long id, Model model) {
    var menuItem = new MenuItem();
    menuItem.setRestaurantId(id);
    model.addAttribute("menuItem", menuItem);
    return "create-menu-item-view";
  }

  @PostMapping("/menu-item/save")
  public String saveMenuItem(@ModelAttribute MenuItem menuItem, Model model) {
    var restaurant = restaurantRepository.findById(menuItem.getRestaurantId()).orElseThrow();
    restaurant.getMenuItems().add(menuItem);
    restaurant = restaurantRepository.save(restaurant);
    model.addAttribute("restaurant", restaurant);
    return "restaurant-view";
  }



  @GetMapping("/menu-item/{id}/edit")
  public String viewEditMenuItem(@PathVariable("id") Long menuItemId, Model model) {
    try {
      MenuItem menuItem = findMenuItemById(menuItemId);
      model.addAttribute("menuItem", menuItem);
      return "edit-menu-item-view";
    } catch (NoSuchElementException e) {
      model.addAttribute("error", e.getMessage());
      return "error-view";
    }
  }

  @PostMapping("/menu-item/update")
  public String updateMenuItem(@ModelAttribute MenuItem menuItem, Model model) {
    Restaurant restaurant = restaurantRepository.findById(menuItem.getRestaurantId())
            .orElseThrow(() -> new NoSuchElementException("Restaurant with ID " + menuItem.getRestaurantId() + " not found"));
    restaurant.getMenuItems().removeIf(item -> item.getId().equals(menuItem.getId()));
    restaurant.getMenuItems().add(menuItem);
    restaurantRepository.save(restaurant);
    model.addAttribute("restaurant", restaurant);
    return "restaurant-view";
  }

  private MenuItem findMenuItemById(Long menuItemId) {
    return StreamSupport.stream(restaurantRepository.findAll().spliterator(), false)
            .flatMap(restaurant -> restaurant.getMenuItems().stream())
            .filter(menuItem -> menuItem.getId().equals(menuItemId))
            .findFirst()
            .orElseThrow(() -> new NoSuchElementException("MenuItem with ID " + menuItemId + " not found"));
  }
}
