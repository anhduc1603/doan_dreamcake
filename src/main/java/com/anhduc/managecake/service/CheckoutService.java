package com.anhduc.managecake.service;

import com.anhduc.managecake.model.CartDetail;
import com.anhduc.managecake.model.Checkout;
import com.anhduc.managecake.reponsitory.CartDetailReponsitory;
import com.anhduc.managecake.reponsitory.CheckoutReponsitory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CheckoutService {

    @Autowired
    CheckoutReponsitory carReponsitory;

    @Autowired
    CartDetailReponsitory cartDetailReponsitory;


    public List<Checkout> getAllCheckout(){
        return carReponsitory.findAll();
    }
    public void addCheckout(Checkout cart){
        carReponsitory.save(cart);
    }

    public void removeCheckoutById(long id){
        carReponsitory.deleteById(id);
    }
    public Optional<Checkout> getCheckoutId(Long id){
        return carReponsitory.findById(id);
    }

    public void addCartDetail(CartDetail cart){
        cartDetailReponsitory.save(cart);
    }

    public List<CartDetail> getAllCartDetail(int id){
        return cartDetailReponsitory.getAllCartDetail(id);
    }

    public void removeCartDetailById(int id){
        cartDetailReponsitory.removeCartDetailBy(id);
    }


}
