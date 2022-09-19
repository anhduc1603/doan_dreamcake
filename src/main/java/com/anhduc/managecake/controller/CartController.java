package com.anhduc.managecake.controller;

import com.anhduc.managecake.global.GlobalData;
import com.anhduc.managecake.model.CartDetail;
import com.anhduc.managecake.model.Checkout;
import com.anhduc.managecake.model.Product;
import com.anhduc.managecake.service.CheckoutService;
import com.anhduc.managecake.service.ProductService;
import com.anhduc.managecake.service.UserSerivce;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

@Controller
public class CartController {
    @Autowired
    ProductService productService;

    @Autowired
    UserSerivce userSerivce;

    @Autowired
    CheckoutService checkoutService;

    @GetMapping("/addToCart/{id}")
    public String addToCart(@PathVariable int id){
        GlobalData.cart.add(productService.getProductById(id).get());
        return "redirect:/shop";
    }

    @GetMapping("/cart")
    public String cartGet(Model model){
        model.addAttribute("cartCount",GlobalData.cart.size());
        model.addAttribute("total",GlobalData.cart.stream().mapToDouble(Product::getPrice).sum());
        model.addAttribute("cart",GlobalData.cart);
        return "/cart/cart";
    }

    @GetMapping("/cart/removeItem/{index}")
    public String cartItemRemove(@PathVariable int index){
        GlobalData.cart.remove(index);
        return "redirect:/cart";
    }

    @GetMapping("/cart/removeItemInCheckout/{index}")
    public String cartItemRemoveInCheckout(@PathVariable int index){
        GlobalData.cart.remove(index);
        return "redirect:/checkout";
    }

    @GetMapping("/checkout")
    public String checkout(Model model){
        Checkout checkout = new Checkout();
        model.addAttribute("checkout",checkout);
        model.addAttribute("cart",GlobalData.cart);
        model.addAttribute("total",GlobalData.cart.stream().mapToDouble(Product::getPrice).sum());

        return "cart/checkout2";
    }

    @PostMapping ("/receipt")
    public String receipt(@ModelAttribute("checkout") Checkout checkout, Model model){

        Checkout c = new Checkout();
        c.setFullName(checkout.getFullName());
        c.setPhone(checkout.getPhone());
        c.setAddress(checkout.getAddress());
        c.setCity(checkout.getCity());
        c.setEmail(checkout.getEmail());
        c.setDistrict(checkout.getDistrict());
        c.setNote(checkout.getNote());

        SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss", Locale.getDefault());
        String today = sdf.format(new Date());
        c.setDatetime(today);


        checkoutService.addCheckout(c);
        System.out.println(c);
        model.addAttribute("cart",GlobalData.cart);
        for (int i = 0; i < GlobalData.cart.size(); i++) {
            CartDetail cartDetail = new CartDetail();

            cartDetail.setIdCheckout(c.getId());
            cartDetail.setNameProduct(GlobalData.cart.get(i).getName());
            cartDetail.setPrice(String.valueOf(GlobalData.cart.get(i).getPrice()));
            cartDetail.setAmount(1);
            checkoutService.addCartDetail(cartDetail);
        }
        GlobalData.cart.clear();
        return "/cart/orderPlaced";
    }

    @GetMapping("/cart/{id}")
    public String getAllCartDetail(@PathVariable int id,Model model){
        List<CartDetail> cartDetailList =  checkoutService.getAllCartDetail(id);
        model.addAttribute("cartdetail",cartDetailList);
        return "admin/cart/cartdetail";
    }


}
