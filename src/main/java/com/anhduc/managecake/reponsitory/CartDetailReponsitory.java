package com.anhduc.managecake.reponsitory;

import com.anhduc.managecake.model.CartDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
public interface CartDetailReponsitory extends JpaRepository<CartDetail, Integer> {

    @Query(value = "SELECT cd.id,cd.id_checkout,cd.id_checkout,cd.name_product,cd.price,cd.amount FROM checkout as c INNER JOIN cart_detail  as cd ON c.id = cd.id_checkout AND c.id = ?1", nativeQuery = true)
    List<CartDetail> getAllCartDetail(int id);


    @Modifying
    @Transactional
    @Query(value = " DELETE FROM cart_detail  WHERE id_checkout = ?1", nativeQuery = true)
    void removeCartDetailBy(int id);
}
