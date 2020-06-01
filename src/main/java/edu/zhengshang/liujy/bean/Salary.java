package edu.zhengshang.liujy.bean;

public class Salary {
    private Integer id;

    private Integer deId;

    private Integer count;

    private Double salary;

    private Integer isDel;


    //新添加属性，整合bean 结合salary和driver,属性名是表字段别名
    private String dervername;
    private String derverphone;
    private Integer derverage;
    private Integer derverid;
    private Double derverprice;



    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getDeId() {
        return deId;
    }

    public void setDeId(Integer deId) {
        this.deId = deId;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Double getSalary() {
        return salary;
    }

    public void setSalary(Double salary) {
        this.salary = salary;
    }

    public Integer getIsDel() {
        return isDel;
    }

    public void setIsDel(Integer isDel) {
        this.isDel = isDel;
    }




    public String getDervername() {
        return dervername;
    }

    public void setDervername(String dervername) {
        this.dervername = dervername;
    }

    public String getDerverphone() {
        return derverphone;
    }

    public void setDerverphone(String derverphone) {
        this.derverphone = derverphone;
    }

    public Integer getDerverage() {
        return derverage;
    }


    public void setDerverage(Integer derverage) {
        this.derverage = derverage;
    }


    public Integer getDerverid() {
        return derverid;
    }


    public void setDerverid(Integer derverid) {
        this.derverid = derverid;
    }


    public Double getDerverprice() {
        return derverprice;
    }


    public void setDerverprice(Double derverprice) {
        this.derverprice = derverprice;
    }

}