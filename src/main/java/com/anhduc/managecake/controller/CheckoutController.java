package com.anhduc.managecake.controller;

import com.anhduc.managecake.model.Checkout;
import com.anhduc.managecake.service.CheckoutService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Controller
public class CheckoutController {

    @Autowired
    CheckoutService checkoutService;




    @GetMapping("/checkout/all")
    public List<Checkout> checkoutAll(){
        return checkoutService.getAllCheckout();
    }

    @GetMapping("/checkout/delete/{id}")
    public String deleteCheckout(@PathVariable("id") Long id){
        checkoutService.removeCheckoutById( id);
        checkoutService.removeCartDetailById(Math.toIntExact(Long.valueOf(id)));
        return "redirect:/checkout/cart";
    }

    @GetMapping("/checkout/cart")
    public String getCart(Model model){
        model.addAttribute("checkouts",checkoutService.getAllCheckout());
        return "/admin/cart/cart";
    }

    @GetMapping("/checkout/cart/{id}")
    public String getCartProductDetail(@PathVariable long id,Model model){
        model.addAttribute("checkouts",checkoutService.getAllCheckout());
        return "/admin/cart/cart";
    }


}
