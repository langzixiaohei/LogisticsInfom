package edu.zhengshang.liujy.dao;

import edu.zhengshang.liujy.bean.Order;

import java.util.List;

public interface OrderMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Order record);

    int insertSelective(Order record);

    /**
     * 查询所有订单
     * @param order
     * @return
     */
    List<Order> selectByPrimary(Order order);

    /**
     * 查询个人所有订单
     * @param order
     * @return
     */
    List<Order> selectByPrimary1(Order order);

    Order selectByPrimaryKey(Integer id);

    /**
     * 异常订单查询
     * @return
     */
    List<Order> selectByPrimaryyc();

    /**
     * 根据goodsid查询订单
     * @param goodsid
     * @return
     */
    Order getbygoodsid(Integer goodsid);

    /**
     * 查询未分配的订单
     * @return
     */
    List<Order> selectByPrimarywfp();

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);

    List<Order> all();
}