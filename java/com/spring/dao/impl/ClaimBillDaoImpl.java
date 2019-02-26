package com.spring.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.spring.dao.ClaimBillDao;
import com.spring.model.CategoryModel;
import com.spring.model.ClaimBillModel;

@Repository
public class ClaimBillDaoImpl implements ClaimBillDao {
private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate){
		this.jdbcTemplate=jdbcTemplate;
	}
	
	@Autowired
	public void setDataSource(DataSource dataSource){
		this.jdbcTemplate=new JdbcTemplate(dataSource);
	}
	public boolean insertClaimBill(ClaimBillModel c) {
		boolean status = false;
		String sql = "insert into claim_bill_tbl(fromDateEn,fromDateNep,toDateEn,toDateNep,invoiceNo,invoiceDateEn,invoiceDateNep,receivedby,nontaxable_totalfees,taxable_totalfees,totalfees,nontaxable_discount,taxable_discount,totaldiscount,nontaxable_total,taxable_total,total,tax_percentage,tax_amount,grand_total,drcr_previous_balance,total_receivable,studentid) "
				                     + "values('"+c.getFromDateEn()+"','"+c.getFromDateNep()+"','"+c.getToDateEn()+"','"+c.getToDateNep()+"','"+c.getInvoiceNo()+"','"+c.getInvoiceDateEn()+"','"+c.getInvoiceDateNep()+"','"+c.getReceivedby()+"','"+c.getNontaxable_totalfees()+"','"+c.getTaxable_totalfees()+"','"+c.getTotalfees()+"','"+c.getNontaxable_discount()+"','"+c.getTaxable_discount()+"','"+c.getTotaldiscount()+"','"+c.getNontaxable_total()+"','"+c.getTaxable_total()+"','"+c.getTotal()+"','"+c.getTax_percentage()+"','"+c.getTax_amount()+"','"+c.getGrand_total()+"','"+c.getDrcr_previous_balance()+"','"+c.getTotal_receivable()+"','"+c.getStudent().getStudentid()+"')";
		int i = jdbcTemplate.update(sql);

		if (i > 0) {
			status = true;
		}
		return status;
	}
	
	public String maxClaimBillId() {
		String sql = "select max(claim_bill_id) as maxid from claim_bill_tbl";
		return jdbcTemplate.queryForObject(sql, String.class);
	}
	
	public boolean insertClaimBillContent(ClaimBillModel c, int i) {
		boolean status = false;
		String sql="";
		System.out.println(c.getNontaxableamount().get(i)+"shssh");
		
		if(c.getNontaxableamount().get(i).isEmpty()){
			System.out.println("its empty");
			 sql = "insert into claim_bill_content(categoryId, nontaxableamount, taxableamount, totalamount, claim_bill_id) values('"+c.getCategory().getCategoryIdList().get(i)+"','0.00','"+c.getTaxableamount().get(i)+"','"+c.getTotalamount().get(i)+"','"+c.getClaim_bill_id()+"')";
		}
		else
		{
			 sql = "insert into claim_bill_content(categoryId, nontaxableamount, taxableamount, totalamount, claim_bill_id) values('"+c.getCategory().getCategoryIdList().get(i)+"','"+c.getNontaxableamount().get(i)+"','0.00','"+c.getTotalamount().get(i)+"','"+c.getClaim_bill_id()+"')";
		}
		
		int j = jdbcTemplate.update(sql);

		if (j > 0) {
			status = true;
		}
		return status;
		
	}

	@Override
	public ArrayList<ClaimBillModel> getAllDetails(String id, String getmonth) {
		
		String query="select * from claimbillreport where pid='"+id+"'"; 
	ArrayList<ClaimBillModel> list= (ArrayList<ClaimBillModel>) jdbcTemplate.query(query, new ClaimMapper());
	
	for(int i=0;i<list.size();i++) {
		
	if(list.get(i).getPaymenttype().equals("M")) {
		
		//-------------------------------------------------------------------
		
		String freq = list.get(i).getFrequency();
		System.out.println("frequency is"+freq);
		
		String studentid = id;
		int findForMonth = Integer.parseInt(getmonth);
		
		int startmonth=Integer.parseInt(list.get(i).getStartmonth()); // from table
		
		List<String> paymonth= new ArrayList<String>();
		for(int j=startmonth; j<=12; j++) {
			int tomonth = j+Integer.parseInt(freq)-1;
			if(tomonth>12) {
				tomonth=12;
			}
			
			String paymonthstr = j+"-"+tomonth;
			paymonth.add(paymonthstr);
			j=tomonth;
		}
		String realpaymonth="";
		//month=04 [3-8, 9-12]
		for(int k=0; k<paymonth.size();k++) {
			
			String paym =	paymonth.get(k);
			String[] paymsplit = paym.split("-");
			int first = Integer.parseInt(paymsplit[0]);
			int second = Integer.parseInt(paymsplit[1]);
			if(findForMonth>=first && findForMonth<=second) {
				realpaymonth = paym;
				System.out.println(realpaymonth);
			}
			
		}
		
		//for checking if claim bill generated already
		String[] realpaymonthpart=realpaymonth.split("-");
		int low=Integer.parseInt(realpaymonthpart[0]);
		int high=Integer.parseInt(realpaymonthpart[1]);
		int formonth=Integer.parseInt(getmonth);
		
		if(formonth>low && formonth<=high)
		{
			System.out.println("Claim Bill Exists Already");
			return null;
		}
			
		
		
		System.out.println(paymonth);
		System.out.println("real paymonth is" +realpaymonth);
		
		//----------------------------------------------------------------------------------------
		
		
		
	String genUpto=list.get(i).getGenerateduptpmonth();
	//String startmonth=list.get(i).getStartmonth();
	String[] realpaymonthsplit=realpaymonth.split("-");
	String claimBillStartMonth= realpaymonthsplit[0];
	String claimBillEndMonth=   realpaymonthsplit[1];
	
	//03-06 .... feemonths = 6-3+1
	
	int smonthval=Integer.parseInt(claimBillStartMonth);//05
		int frequency = Integer.parseInt(claimBillEndMonth)-smonthval+1;
		//int frequency=Integer.parseInt(freq);//6
		
		
		/*if(frequency+smonthval>=12) {
			if(frequency==12) {
				frequency=12;
			}
			else {
			frequency=12-smonthval;
			}
		}*/
		
		if((list.get(i).getTamount())>0) {
			list.get(i).setTamount((frequency*(list.get(i).getFrate())));
	}
	
	 if((list.get(i).getNamount())>0) {
		 list.get(i).setNamount((frequency*(list.get(i).getFrate())));
		
		}
	 double totalfrate =(list.get(i).getTamount()) + (list.get(i).getNamount());
	 list.get(i).setFrate((totalfrate));
	}
	}
		
		return list;
		
		//	return (ArrayList<ClaimBillModel>)jdbctemplate.query(query,new BeanPropertyRowMapper<ClaimBillModel>(ClaimBillModel.class));
	}
	public static final class ClaimMapper implements RowMapper<ClaimBillModel>
	{

		@Override
		public ClaimBillModel mapRow(ResultSet rs, int rowNum) throws SQLException {
			ClaimBillModel c= new ClaimBillModel();
			
			CategoryModel cat=new CategoryModel();
			cat.setCategoryId(rs.getString("categoryId"));
			cat.setCategoryHead(rs.getString("categoryHead"));
			c.setCategory(cat);
			
			c.setAccountNumber(rs.getString("accountNumber"));
			//c.setAdmissionclass(rs.getString("admissionclass"));
		
			c.setFrate(rs.getDouble("amount"));
		
			c.setTaxable(rs.getString("taxable"));
			c.setTamount(rs.getDouble("tamount"));
			c.setNamount(rs.getDouble("namount"));
			
		
			c.setFrequency(rs.getString("frequency"));
			c.setStartmonth(rs.getString("startmonth"));
			c.setGenerateduptpmonth(rs.getString("generateduptomonth"));
			c.setPaymenttype(rs.getString("paymenttype"));
			c.setDiscountamount(rs.getDouble("discountamount"));
			
			return c;
		}
		
	}
	@Override
	public int saveClaimBill(String studentId,ClaimBillModel c,String getmonth,Double taxRate) {
		
		int startmonth=Integer.parseInt(c.getStartmonth()); 
		String freq=c.getFrequency();
		int findForMonth = Integer.parseInt(getmonth);
	
		List<String> paymonth= new ArrayList<String>();
		for(int j=startmonth; j<=12; j++) {
			int tomonth = j+Integer.parseInt(freq)-1;
			if(tomonth>12) {
				tomonth=12;
			}
			
			String paymonthstr = j+"-"+tomonth;
			paymonth.add(paymonthstr);
			j=tomonth;
		}
		String realpaymonth="";
		//month=04 [3-8, 9-12]
		for(int k=0; k<paymonth.size();k++) {
			
			String paym =	paymonth.get(k);
			String[] paymsplit = paym.split("-");
			int first = Integer.parseInt(paymsplit[0]);
			int second = Integer.parseInt(paymsplit[1]);
			if(findForMonth>=first && findForMonth<=second) {
				realpaymonth = paym;
				System.out.println(realpaymonth);
			}
		}
		System.out.println(c);
		
		Double taxAmount=c.getTamount()*(taxRate/100);
		
		Double totalAmount=(c.getTamount()+c.getNamount())+taxAmount-c.getDiscountamount();
		String query = "insert into generatedclaimbill (studentid, accountNumber, categoryId, taxableAmount, nonTaxableAmount,inputter, datetime,formonth,discountamount,total,taxAmount) values ('"+studentId+"','"+c.getAccountNumber()+"','"+c.getCategory().getCategoryId()+"','"+c.getTamount()+"','"+c.getNamount()+"','inputter',now(),'"+realpaymonth+"','"+c.getDiscountamount()+"','"+totalAmount+"','"+taxAmount+"')";
		System.out.println(query);
		try {
		return jdbcTemplate.update(query);
		}
		catch(Exception s) {
			System.out.println("Sql Exception "+s);
			return 0;
		}
	}

	@Override
	public boolean updateBalance(ClaimBillModel c, String id) {
		
		
		Double totalAmount=(c.getTamount()+c.getNamount())-c.getDiscountamount();
		String sql="update accountstbl set debitbal=debitbal+'"+totalAmount+"' where pid='"+id+"' and accountNumber='"+c.getAccountNumber()+"'";
		System.out.println(sql);
		int status=jdbcTemplate.update(sql);
		if(status>0) {
			return true;
		}
			
		return false;
	}

	@Override
	public Double calculatePreviousBalance(String id) {
		String sql="select debitbal from accountstbl where pid=565 and categoryId like '22%'";
		List<Double> list= jdbcTemplate.queryForList(sql, Double.class);
		Double previousReceivable=0.00;
		for(int i=0;i<list.size();i++) {
			previousReceivable=previousReceivable+list.get(i);
		}
		System.out.println("previousReceivable "+previousReceivable);
		return previousReceivable;
	}
	

}
