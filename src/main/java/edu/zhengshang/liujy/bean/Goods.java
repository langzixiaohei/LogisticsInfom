package edu.zhengshang.liujy.bean;

public class Goods {
    private Integer id;

    private String goodName;

    private String goodStype;

    private Double weight;

    private Integer isDel;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getGoodName() {
        return goodName;
    }

    public void setGoodName(String goodName) {
        this.goodName = goodName == null ? null : goodName.trim();
    }

    public String getGoodStype() {
        return goodStype;
    }

    public void setGoodStype(String goodStype) {
        this.goodStype = goodStype == null ? null : goodStype.trim();
    }

    public Double getWeight() {
        return weight;
    }

    public void setWeight(Double weight) {
        this.weight = weight;
    }

    public Integer getIsDel() {
        return isDel;
    }

    public void setIsDel(Integer isDel) {
        this.isDel = isDel;
    }
}