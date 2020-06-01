package edu.zhengshang.liujy.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import edu.zhengshang.liujy.bean.*;
import edu.zhengshang.liujy.service.*;
import edu.zhengshang.liujy.util.DateUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	Adminservice adminservice;

	@Autowired
	Driverservice driverservice;

	@Autowired
	Truckservice truckservice;
	
	@Autowired
	Linkmanservice linkmanservice;
		
	@Autowired
	Orderservice orderservice;
	@Autowired
	Recordservice recordservice;
	@Autowired
	Goodsservice goodsservice;
	@Autowired
	Salaryservice salaryservice;
	@Autowired
	Outevenservice outevenservice;
	@Autowired
	Payrecordservice payrecordservice;

    //管理员登录
	@RequestMapping("login")
	public String login(String username,String password,HttpSession session,HttpServletRequest request){
		
		Admin admin1=new Admin();
		admin1.setUserName(username);
		admin1.setPassWord(password);
		Admin admin=adminservice.login(admin1);
		if(admin !=null){//登陆成功
			session.setAttribute("admin", admin);
			//查公司所有员工
			List<Driver> drivers=driverservice.getlist();
			session.setAttribute("drivers", drivers);
			
		}else{
			request.setAttribute("error", "用户名密码错误");
			return "HOUTAI/login";
		}
		
		return "HOUTAI/index";
	}
	//管理员退出
	@RequestMapping("logout")
	public String logout(HttpSession session){
		session.removeAttribute("admin");
		return "redirect:/HOUTAI/login.jsp";
	}
	
	//删除员工
	@RequestMapping("deleteyg")
	public String deleteyg(HttpSession session,String id){
		
		//删除
		Driver driver=new Driver();
		driver.setId(Integer.parseInt(id));
		driverservice.delete(driver);
		//查公司所有员工
		List<Driver> drivers=driverservice.getlist();
		session.setAttribute("drivers", drivers);
		
		return "HOUTAI/lianjie/yuangong_list";
	}
	
	//修改员工
	@RequestMapping("updateyg")
	public String updateyg(HttpSession session,Driver driver){		
		//修改
		driverservice.update(driver);
		//查公司所有员工
		List<Driver> drivers=driverservice.getlist();
		session.setAttribute("drivers", drivers);		
		return "HOUTAI/lianjie/yuangong_list";
	}
	
	//添加员工
	@RequestMapping("insertyg")
	public String insertyg(HttpSession session,Driver driver){		
		//修改
		driver.setStatus(0);
		driver.setIsDel(0);
		driverservice.insert(driver);		
		//根据员工电话来查询该员工
		Driver driver2=driverservice.getbyphone(driver.getPhone());
		//在添加工资表
		Salary salary=new Salary();
		salary.setIsDel(0);
		salary.setCount(0);
		salary.setSalary(0.0);
		salary.setDeId(driver2.getId());
		salaryservice.add(salary);
		//查公司所有员工
		List<Driver> drivers=driverservice.getlist();
		session.setAttribute("drivers", drivers);		
		return "HOUTAI/lianjie/yuangong_list";
	}
	
	
	
	
	//查看员工
	@RequestMapping("getbyidyg")
	@ResponseBody
	public Driver getbiidyg(HttpSession session,String id){		
		Driver driver=driverservice.getby(Integer.parseInt(id));
		return driver;
	}	
	
	//客户关系查询
	@RequestMapping("khgx")
	public ModelAndView khgx(HttpSession session){
		//
		List<Linkman> linkmans=linkmanservice.getbylist();
		ModelAndView modelAndView=new ModelAndView();
		System.out.println("linkmans==============="+linkmans);
		modelAndView.addObject("linkmans",linkmans);
		modelAndView.setViewName("HOUTAI/lianjie/kehuguanxi_list");
		 //session.setAttribute("linkmans", linkmans);
		 //return "HOUTAI/lianjie/kehuguanxi_list";
		return modelAndView;
	}
	
	
	//查询所有运输需求
	@RequestMapping("getlistorder")
	public String getlistorder(HttpSession session,String ordernumber,String creattime){		
		//查已分配订单
		Order order=new Order();
		if(ordernumber !=null && ordernumber !=""){
			order.setOrderNumber(Integer.parseInt(ordernumber));
		}
		if(creattime !=null && creattime !=""){
			order.setCreateTime(creattime);
		}
		
		List<Order> orders=orderservice.getorder(order);
		session.setAttribute("orders", orders);
		return "HOUTAI/lianjie/order_list";
	}
	
	//运输需求下单
	@RequestMapping("getlistorderdiaodu")
	public String getlistorderdiaodu(HttpSession session){		
		//调度查未分配订单
		List<Order> ordersdiaodu=orderservice.dingdanwfp();
		session.setAttribute("ordersdiaodu", ordersdiaodu);

		//未分配的车辆
		List<Truck> trucks=truckservice.getlist(0);
		//未分配的司机
		List<Driver> drivers=driverservice.getztlist(0);
		session.setAttribute("trucks", trucks);
		session.setAttribute("drivers", drivers);
		
		return "HOUTAI/lianjie/orderdiaodu_list";
	}
	//查询所有异常订单
	@RequestMapping("getlistycorder")
	public String getlistycorder(HttpSession session){				
		List<Order> ycorders=orderservice.getbyycorder();
		session.setAttribute("ycorders", ycorders);
		return "HOUTAI/lianjie/yichangorder_list";
	}
	
	//查询所有异常订单
	
	
	//删除订单
	@RequestMapping("delorder")
	@ResponseBody
	public boolean delorder(String id,HttpSession session){
		boolean flag=false;
		Order order=new Order();
		order.setId(Integer.parseInt(id));
		order.setIsDel(1);
		if(orderservice.update(order)){
			flag=true;
		}
		List<Order> ycorders=orderservice.getbyycorder();
		session.setAttribute("ycorders", ycorders);
		return flag;
	}
	//异常订单处理
	@RequestMapping("ycordercl")
	@ResponseBody
	public boolean ycordercl(String id,HttpSession session){
		boolean flag=false;
		Order order=new Order();
		order.setId(Integer.parseInt(id));
		order.setStauts("正在运输");
		order.setUnusual(0);
		if(orderservice.update(order)){
			flag=true;
		}
		List<Order> ycorders=orderservice.getbyycorder();
		session.setAttribute("ycorders", ycorders);
		
		return flag;
	}
	
	
	
	//订单调度配置司机车辆
		@RequestMapping("dingdanpeizhi")
		public String dingdanpeizhi(HttpSession session,String id,String sijiid,String kacheid){
			//设置订单司机和卡车id  和规划路线
			Order order=new Order();
			order.setId(Integer.parseInt(id));
			order.setDriverId(Integer.parseInt(sijiid));
			order.setTruckId(Integer.parseInt(kacheid));
			if(orderservice.update(order)){
				//改变卡车司机状态
				Truck truck=new Truck();
				truck.setStauts(1);
				truck.setId(Integer.parseInt(kacheid));
				truckservice.update(truck);
				Driver driver=new Driver();
				driver.setId(Integer.parseInt(sijiid));
				driver.setStatus(1);
				driverservice.update(driver);
				//再查一次
				List<Driver> drivers=driverservice.getlist();
				session.setAttribute("drivers", drivers);
				List<Truck> trucks=truckservice.getlist(0);
				session.setAttribute("drivers", drivers);
			}
			//调度查未分配订单
			List<Order> ordersdiaodu=orderservice.dingdanwfp();
			session.setAttribute("ordersdiaodu", ordersdiaodu);
			
			
			return "HOUTAI/lianjie/orderdiaodu_list";
		}
		
		
		//待出库商品查询
		@RequestMapping("shangpingchuku")
		public String shangpingchuku(HttpSession session){
			//查询货物在状态为已入库（代收点已经收取）
			List<Goods> goods=goodsservice.getbyzhuangtai("已入库");
			session.setAttribute("goods", goods);
			return "HOUTAI/lianjie/goods_list";
		}
		
		//商品出库
		@RequestMapping("shangpingchukucaozuo")
		@ResponseBody
		public boolean shangpingchuku(String id){
			boolean flag=false;
			
			//商品一旦出库 订单正在运输
			//根据商品id修改商品状态
			Goods goods=new Goods();
			goods.setId(Integer.parseInt(id));
			goods.setGoodStype("已出库");
			if(goodsservice.update(goods)){
				System.out.println("商品出库成功");
			}
	
			Order order=orderservice.getbygoodsid(Integer.parseInt(id));
			//修改订单状态
			Order order2=new Order();
			order2.setId(order.getId());
			order2.setStauts("运输中");
			order2.setOrgenzong("寄件网点已发出");
			if(orderservice.update(order2)){
				System.out.println("订单已出库");
				//添加出库记录
				//根据商品id查询商品信息
				Goods goods2=goodsservice.getbyidlist(Integer.parseInt(id));
				Outeven outeven=new Outeven();
				outeven.setGoodName(goods2.getGoodName());
				outeven.setGoodGg(Double.toString(goods2.getWeight())+"KG");
				outeven.setGoodType(goods2.getGoodStype());
				outeven.setOutTime(DateUtil.getCurrentDate());
				outeven.setIsDel(0);
				if(outevenservice.insert(outeven)){
					System.out.println("出库记录添加成功");
				}				
				flag=true;
			}			
			return flag;
		}
		//查询已出库商品（商品到收件地点入库）
		@RequestMapping("shangpingruku")
		public String shangpingruku(HttpSession session){
			//查询货物在状态为已出库
			List<Goods> goodchu=goodsservice.getbyzhuangtai("已出库");
			session.setAttribute("goodchu", goodchu);
			return "HOUTAI/lianjie/goods_list1";
		}
		
		//查询出库记录
		@RequestMapping("chukujilu")
		public String chukujilu(HttpSession session){
		List<Outeven>  outevens=outevenservice.selectall();
		session.setAttribute("outevens", outevens);
		return "HOUTAI/lianjie/chukujilu";
		}
		
		//商品入库操作
		@RequestMapping("shangpingrukucaozuo")
	    @ResponseBody
		public boolean shangpingrukucaozuo(String id){
			boolean flag=false;
				
			//商品一旦出库 订单待收货
			//根据商品id修改商品状态
			Goods goods=new Goods();
			goods.setId(Integer.parseInt(id));
			goods.setGoodStype("等待配送");
			if(goodsservice.update(goods)){
				System.out.println("商品入库成功");
			}
			
			Order order=orderservice.getbygoodsid(Integer.parseInt(id));
			//修改订单状态
			Order order2=new Order();
			order2.setId(order.getId());
			order2.setStauts("待确认");
			order2.setOrgenzong("已到达收件网店");
			if(orderservice.update(order2)){
				System.out.println("订单已入库");
				flag=true;
			}
			return flag;
		}
		
		
		//查询所有货物信息
		@RequestMapping("getbylisthuowu")
		public String getbylisthuowu(HttpSession session,String goodsname){
			Goods goods=new Goods();
			if(goodsname != null &&  goodsname !=""){
				//String[] srt=goodsname.split(",");
				goods.setGoodName(goodsname);
			}
			List<Goods> goodssy=goodsservice.getbylist(goods);
			//List<Goods> goodssy=null;
			session.setAttribute("goodssy", goodssy);
			return "HOUTAI/lianjie/huowu_list";
		}
		
		//查询单个货物信息
		@RequestMapping("getbyidgoods")
		@ResponseBody
		public Goods getbyidgoods(String id){
			
			Goods goods=goodsservice.getbyidlist(Integer.parseInt(id));			
			return goods;
		}
		
		//查看所有支付记录s
		@RequestMapping("getzhifujilu")
		public String getzhifujilu(HttpSession session,String paytime1){
			Payrecord payrecord=new Payrecord();
				payrecord.setUserName(paytime1);
			 List<Payrecord> payrecords=payrecordservice.selectall(payrecord);
			 session.setAttribute("payrecords", payrecords);
			 return "HOUTAI/lianjie/zhifujilu";
		}
		
		//删除单个货物信息
		@RequestMapping("delgoods")
		@ResponseBody
		public boolean delgoods(String id){
			boolean flag=false;
			Goods goods=new Goods();
			goods.setId(Integer.parseInt(id));
			goods.setIsDel(1);//
		    if(goodsservice.update(goods)){
		    	flag=true;
		    }
			return flag;
		}
		
		@RequestMapping("updatehuowu")
		public String updatehuowu(HttpSession session,String id,String name,String weight){
		
			Goods goods=new Goods();
			goods.setId(Integer.parseInt(id));
			goods.setGoodName(name);
			goods.setWeight(Double.valueOf(weight.toString()));
		    if(goodsservice.update(goods)){
		    	System.out.println("货物修改成功");
		    }
		    Goods goods2=new Goods();
			List<Goods> goodssy=goodsservice.getbylist(goods2);
			session.setAttribute("goodssy", goodssy);
		    return "HOUTAI/lianjie/huowu_list";
		}
		//查询员工工资
		@RequestMapping("getyuangongzi")
		public String getyuangongzi(HttpSession session){
			List<Salary> salaries=salaryservice.getallgz();
			session.setAttribute("salaries", salaries);
			return "HOUTAI/lianjie/gongzi";
		}
		//查询员工工资和公司收入
		@RequestMapping("gongsishouru")
		public String gongsishouru(HttpServletRequest request){
			//查出所有已收货订单相加得到公司收入
			List<Order> orders=orderservice.all();
			Double count=0.0;
			for(Order order:orders) {
				count+=order.getMoney();
			}
			String gongsi=String.valueOf(count);
			request.setAttribute("gongsi", gongsi);
			//查出所有员工工资相加
			List<Salary> salaries=salaryservice.all();
			Double salarievount=0.0;
			for(Salary salary:salaries) {
				salarievount+=salary.getSalary();
			}
			String yuangong=String.valueOf(salarievount);
			request.setAttribute("yuangong", yuangong);
			return "HOUTAI/lianjie/gongsicaiwu";
		}
}