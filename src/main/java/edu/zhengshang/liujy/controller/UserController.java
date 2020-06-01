package edu.zhengshang.liujy.controller;


import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import edu.zhengshang.liujy.bean.*;
import edu.zhengshang.liujy.service.*;
import edu.zhengshang.liujy.util.DateUtil;
import edu.zhengshang.liujy.util.DateUtil2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/user")
public class UserController {
	
	@Autowired
	Userservice userService;
	@Autowired
	Dictionaryservice dictionaryservice;
	@Autowired
	Orderservice orderservice;
	@Autowired
	Linkmanservice linkmanservice;
	@Autowired
	Goodsservice goodsservice;
	@Autowired
	Recordservice recordservice;
	@Autowired
	Wangdianservice wangdianservice;
	@Autowired
	Payrecordservice payrecordservice;
	@Autowired
	Driverservice driverservice;
	@Autowired
	Salaryservice salaryservice;
    //用户登录
	@RequestMapping("login")
	public String login(String usercode,String password,HttpSession session,HttpServletRequest request){
		System.out.println("login");
		User user1=new User();
		user1.setUserCode(usercode);
		user1.setPassWord(password);
		User user=userService.login(user1);
		if(user != null){//登录成功
			session.setAttribute("user", user);
			return "redirect:/QIANTAI/index.jsp";
		}else{
			System.out.println("用户名密码错误");
			request.setAttribute("cuowu","用户名密码错误");			
			return "QIANTAI/login";
		}
	}
	//用户退出
	@RequestMapping("logout")
	@ResponseBody
	public int logout(HttpSession session){
		int x=0;
		session.removeAttribute("user");
		User user=(User)session.getAttribute("user");
		if(user==null){
			x=1;
			return x;
		}
		return x;
	}
	
	//用户注册
	@RequestMapping("insert")
	@ResponseBody
	public boolean insert(@RequestBody User user){
		System.out.println("=============User的值============"+user);
		boolean flag=true;
		user.setIsDel(0);
		user.setWallet(1000.0);//账户充值
	if(user.getUserCode()==null || user.getUserCode() ==""){
			return false;
		}else if(user.getPassWord()==null ||user.getPassWord()==""){
			return false;
		}else if(user.getRealName()==null ||user.getRealName()==""){
			return false;
		}else if(user.getPhone()==null ){
			return false;
		}else if(userService.insert(user)){
			flag=true;		
		}
	
		return flag;
	}
	//物流信息查询
	@RequestMapping(value = "wuliuxx",method = RequestMethod.GET)
	public ModelAndView insert(HttpServletRequest request, HttpSession session){
		ModelAndView modelAndView=new ModelAndView();
		List<Wangdian> wangdians=wangdianservice.selectall();
		modelAndView.addObject("wangdians", wangdians);
		modelAndView.setViewName("QIANTAI/wuliu");
		//System.out.println("======网店信息========："+wangdians);
		//session.setAttribute("wangdians", wangdians);
		return modelAndView;
	}
	//修改个人信息
	@RequestMapping("updateuser")
	public String updateuser(User user1,HttpServletRequest request,HttpSession session){
		System.out.println("=======user1======="+user1);
			if(user1.getPassWord()==null ||user1.getPassWord()==""){
				user1.setPassWord(null);
			}
		if(userService.update(user1)){//修改成功			
			session.removeAttribute("user");
			User user=userService.getby(user1.getId());
			session.setAttribute("user", user);
			request.setAttribute("error", "| 修改成功");
		}else{
			request.setAttribute("error", "| 修改失败");
		}
	    return "QIANTAI/mail";
	}
	
	//添加订单
	@RequestMapping("addorder")
	@ResponseBody
	public boolean addorder(String userid1,String phone,String name,String shouname,String weight,String useraddress,String linkaddress,String phoneshou){
		System.out.println("=====userID======"+userid1);

		boolean flag=false;
		if(name ==null || name==""){
			return false;
		}else if(useraddress ==null || useraddress==""){
			return false;
		}else if(linkaddress ==null || linkaddress==""){
			return false;
		}else{
			//开始添加订单
			//添加货物
			Goods goods=new Goods();
			goods.setGoodName(name);
			goods.setIsDel(0);
			goods.setWeight(Double.valueOf(weight.toString()));
			goods.setGoodStype("待入库");//商品状态
			if(goodsservice.insert(goods)){
				System.out.println("商品添加成功");
			}
			
			Goods goods2=goodsservice.getby(name);//根据商品名称查出商品信息


			//添加收件人
			Linkman linkman=new Linkman();
			linkman.setRealName(shouname);
			linkman.setPhone(phoneshou);
			Linkman linkmans=linkmanservice.getbyNamePhone(linkman);
			if(linkmans ==null){
				linkman.setShouAddress(linkaddress);//收件人地址
				linkman.setUserId(Integer.parseInt(userid1));
				linkman.setIsDel(0);
				if(linkmanservice.insert(linkman)){
					System.out.println("收件人添加成功");
				}
			}else {
				System.out.println("收件人已存在");
			}

			//根据收件人姓名和手机号查出收件人id
			Linkman linkman2=linkmanservice.getbyNamePhone(linkman);

			//查出寄件人id
			//User user=userService.getby1(user1);
			//System.out.println("=========查询user==========="+user);

			Order order=new Order();
			order.setUserId(Integer.parseInt(userid1));//寄件人id
			order.setLinkId(linkman2.getId());//收件人id
			order.setGoodsId(goods2.getId());
			order.setOrderNumber(Integer.parseInt(DateUtil2.getCurrentDate1()));//订单号
			order.setCreateTime(DateUtil.getCurrentDate());
			order.setUserAddress(useraddress);
			order.setLinkAddress(linkaddress);
			order.setUserPhone(phone);
			order.setLinkPhone(phoneshou);
			order.setOrgenzong("订单待处理");
			order.setStauts("未分配");
			order.setUnusual(0);//0表示正常
			
			//判断是省外还是省内
			//取收货地址和寄货地址的前三位判断是否一致
			String ji=useraddress.substring(0, 3);
			String shou=linkaddress.substring(0, 3);
			if(ji.equals(shou)){//标识省内
				order.setServiceType("省内配送");
				order.setMoney(15.00);
			}else{//表示省外
				order.setServiceType("省外配送");
				order.setMoney(25.00);
			}
			order.setPayType(0);//0未支付/1已支付
			order.setIsDel(0);//0未删除/1已删除
			
			if(orderservice.addorder(order)){
				System.out.println("订单添加成功");
				flag=true;
			}
		}
		return flag;
	}
//	//查询个人订单
//	@RequestMapping(value = "getbyorder")
//	public void getbyorder(String ordernumber,HttpServletRequest request,HttpSession session){
//
//		User user=(User)request.getSession().getAttribute("user");
//		System.out.println("========user======="+user);
//		Order order=new Order();
//		order.setUserId(user.getId());
//		if(ordernumber!=null && ordernumber !=""){
//			//String[] str=ordernumber.split(",");
//			order.setOrderNumber(Integer.parseInt(ordernumber));
//		}
//		List<Order> orders=orderservice.getByuserorder(order);
//		System.out.println("========orders======="+orders);
//		session.setAttribute("orders", orders);
//
//		//return "QIANTAI/about";
//	}


	//查询个人订单
	@RequestMapping("getbyorder")
	public String getbyorder(String userid,String ordernumber,HttpServletRequest request){


		Order order=new Order();
		order.setUserId(Integer.parseInt(userid));
		if(ordernumber!=null && ordernumber !=""){
			//String[] str=ordernumber.split(",");
			order.setOrderNumber(Integer.parseInt(ordernumber));
		}
		List<Order> orders=orderservice.getByuserorder(order);
		System.out.println("=======order====="+orders);
		request.setAttribute("orders", orders);

		return "QIANTAI/about";
	}



	
	//查询个人单个订单详情
	@RequestMapping("getbyidorder")
	@ResponseBody
	public Order getbyorder1(String id,HttpServletRequest request,String ordernumber){
		Order order=orderservice.getByuserorder1(Integer.parseInt(id));		
	    return order;
	}
	
	
	//订单异常上报
	@RequestMapping("updateorder")  
	@ResponseBody
	public boolean updateorder(String id,String yichang,HttpServletRequest request){
		boolean flag=false;
		//订单一旦上报异常订单运输停止
		//根据订单id查出订单  对订单状态进行修改
		Order order1=orderservice.getByuserorder1(Integer.parseInt(id));
		order1.setStauts("订单异常已停止运输");
		order1.setUnusual(1);//1异常/0正常
		if(orderservice.update(order1)){
			flag=true;
		}
		return flag;
	}
	
	//订单异常上报
	@RequestMapping("shixiao")  
	@ResponseBody
	public boolean shixiao(String jihuodizhi,String shouhuodizhi,String huowuzhongliang,HttpServletRequest request){
		boolean flag=false;
		
		String ji=jihuodizhi.substring(0, 3);
		String shou=shouhuodizhi.substring(0, 3);
		if(ji.equals(shou)){//标识省内			
			flag=true;
		}else{//表示省外			
			flag=false;
		}				
		return flag;
	}
	
	
	@RequestMapping("shouhuo")  
	@ResponseBody
	public boolean shouhuo(String id){
		boolean flag=false;
		//订单一旦上报异常订单运输停止
		//根据订单id查出订单  对订单状态进行修改
		Order order1=orderservice.getByuserorder1(Integer.parseInt(id));
		order1.setStauts("已收货");
		order1.setOrgenzong("已收货");
		order1.setUnusual(0);//1异常/0正常
		//一旦确认收货商品状态直接改为已收货
		Goods goods=new Goods();
		goods.setId(order1.getGoodsId());
		goods.setGoodStype("已收货");
		goodsservice.update(goods);
		if(orderservice.update(order1)){
			flag=true;
			//修改司机状态 
			Driver driver=new Driver();
			driver.setId(order1.getDriverId());
			driver.setStatus(0);
			driverservice.update(driver);
			//根据司机id查出改司机
			Driver driver2=driverservice.getby(order1.getDriverId());
			//根据司机id查出工资id
			Salary salary=salaryservice.getby(order1.getDriverId());
			//修改工资记录
			Salary salary1=new Salary();
			salary1.setId(salary.getId());
			salary1.setCount(salary.getCount()+1);
			salary1.setSalary((salary.getCount()+1)*driver2.getPrice());
			salaryservice.update(salary1);
		}
		return flag;
	}
	
	
	//订单支付
	@RequestMapping("zhifu")
	@ResponseBody
	public boolean zhifuorder(String id,HttpServletRequest request){
		boolean flag=false;
		//修改寄件人余额 查出订单所需余额 
		Order order1=orderservice.getByuserorder1(Integer.parseInt(id));//查出费用
		User user=userService.getby(order1.getUserId());//查出用户
		//扣除费用
		User user1=new User();
		user1.setId(user.getId());
		user1.setWallet(user.getWallet()-order1.getMoney());
		
		if(userService.update(user1)){//费用扣除成功
			//修改订单状态为 已支付    订单状态未待运输       订单跟踪为已通知缆件   
			Order order=new Order();
			order.setId(Integer.parseInt(id));
			order.setPayType(1);
			order.setOrgenzong("已通知缆件");
			order.setStauts("待运输");
			//添加支付记录表 payrecord 根据订单中商品id查出商品名称
			Goods goods1c=goodsservice.getbyidlist(order1.getGoodsId());
			Payrecord payrecord=new Payrecord();
			payrecord.setOrderId(Integer.parseInt(id));
			payrecord.setUserName(user.getRealName());
			payrecord.setPayTime(DateUtil.getCurrentDate());
			payrecord.setIsDel(0);
			if(payrecordservice.insert(payrecord)){
				System.out.println("支付记录添加成功");
			}
			if(orderservice.update(order)){//支付成功
				
				
				System.out.println("支付成功");
			}
			//修改商品的出入库状态 已入库 根据订单好中的商品id 修改商品状态
						
			Goods goods=new Goods();
			goods.setId(order1.getGoodsId());
			goods.setGoodStype("已入库");
			if(goodsservice.update(goods)){
				System.out.println();
				flag=true;
			}		
		}
		return flag;
		
		
		
	}
	
}