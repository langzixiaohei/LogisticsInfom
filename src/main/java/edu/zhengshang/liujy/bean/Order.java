package edu.zhengshang.liujy.bean;

import lombok.ToString;

@ToString
public class Order {
    private Integer id;

    private Integer userId;

    private Integer linkId;

    private Integer loginfoId;

    private Integer goodsId;

    private Integer driverId;

    private Integer truckId;

    private Integer orderNumber;

    private String createTime;

    private String userAddress;

    private String linkAddress;

    private String userPhone;

    private String linkPhone;

    private String stauts;

    private Integer unusual;

    private String serviceType;

    private Integer payType;

    private Double money;

    private Integer isDel;

    private String orgenzong;


    //新加属性 中和对象属性，结合order,user,linkman,truck,goods表
    private String jiname;
    private String jiphone;
    private String shouname;
    private String shouphone;
    private String goodname;

    private String drivername;
    private String trucknub;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getLinkId() {
        return linkId;
    }

    public void setLinkId(Integer linkId) {
        this.linkId = linkId;
    }

    public Integer getLoginfoId() {
        return loginfoId;
    }

    public void setLoginfoId(Integer loginfoId) {
        this.loginfoId = loginfoId;
    }

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public Integer getDriverId() {
        return driverId;
    }

    public void setDriverId(Integer driverId) {
        this.driverId = driverId;
    }

    public Integer getTruckId() {
        return truckId;
    }

    public void setTruckId(Integer truckId) {
        this.truckId = truckId;
    }

    public Integer getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(Integer orderNumber) {
        this.orderNumber = orderNumber;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime == null ? null : createTime.trim();
    }

    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress == null ? null : userAddress.trim();
    }

    public String getLinkAddress() {
        return linkAddress;
    }

    public void setLinkAddress(String linkAddress) {
        this.linkAddress = linkAddress == null ? null : linkAddress.trim();
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone == null ? null : userPhone.trim();
    }

    public String getLinkPhone() {
        return linkPhone;
    }

    public void setLinkPhone(String linkPhone) {
        this.linkPhone = linkPhone == null ? null : linkPhone.trim();
    }

    public String getStauts() {
        return stauts;
    }

    public void setStauts(String stauts) {
        this.stauts = stauts == null ? null : stauts.trim();
    }

    public Integer getUnusual() {
        return unusual;
    }

    public void setUnusual(Integer unusual) {
        this.unusual = unusual;
    }

    public String getServiceType() {
        return serviceType;
    }

    public void setServiceType(String serviceType) {
        this.serviceType = serviceType == null ? null : serviceType.trim();
    }

    public Integer getPayType() {
        return payType;
    }

    public void setPayType(Integer payType) {
        this.payType = payType;
    }

    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }

    public Integer getIsDel() {
        return isDel;
    }

    public void setIsDel(Integer isDel) {
        this.isDel = isDel;
    }

    public String getOrgenzong() {
        return orgenzong;
    }

    public void setOrgenzong(String orgenzong) {
        this.orgenzong = orgenzong == null ? null : orgenzong.trim();
    }

    public String getDrivername() {
        return drivername;
    }

    public void setDrivername(String drivername) {
        this.drivername = drivername;
    }

    public String getTrucknub() {
        return trucknub;
    }

    public void setTrucknub(String trucknub) {
        this.trucknub = trucknub;
    }

    public String getJiname() {
        return jiname;
    }

    public void setJiname(String jiname) {
        this.jiname = jiname;
    }

    public String getJiphone() {
        return jiphone;
    }

    public void setJiphone(String jiphone) {
        this.jiphone = jiphone;
    }

    public String getShouname() {
        return shouname;
    }

    public void setShouname(String shouname) {
        this.shouname = shouname;
    }

    public String getShouphone() {
        return shouphone;
    }

    public void setShouphone(String shouphone) {
        this.shouphone = shouphone;
    }

    public String getGoodname() {
        return goodname;
    }

    public void setGoodname(String goodname) {
        this.goodname = goodname;
    }

}