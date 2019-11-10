package com.gx.test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;

import java.util.List;

import com.gx.dao.BookDao;
import com.gx.dao.impl.ImplBookDao;
import com.gx.po.BorrowBook;
import com.gx.po.NewBook;

public class Test {
	/*@org.junit.Test
	public void  find(){}*/
	public static void main(String[] args) {
		BookDao bookDao=new ImplBookDao();
		List<NewBook> listAll=	bookDao.findAllBook();
		List<String> Str=new  ArrayList<String>();
	for (NewBook newBook : listAll) 
	{
		Str.add(newBook.getBookMC());
	}
	List<String> Str2=new  ArrayList<String>();
	List<NewBook> list =bookDao.findBorrowAllBookByUserID(22);
		
		for (NewBook newBook : list) 
		{
			Str2.add(newBook.getBookMC());
		}
		List<String> ListStr=getUncontain(Str,Str2);
		
		List<BorrowBook> L=	bookDao.SelectEvaluate(22);//通过用户ID来查询借书数据，安评价降序
		List<NewBook> ListLike=new ArrayList<NewBook>();
		//System.out.println(L.get(0).getEvaluate());
		if( L.get(0).getEvaluate()>=4)//大于4才评为喜爱
		{
			System.out.println();
			String LikeBook= L.get(0).getBookMC();//查询出5星好评的书
		//	System.out.println(LikeBook);
			//下一步，进行与没有读过的书对比
		 ListLike=bookDao.SelectEvaluateByBookname(LikeBook);
		}
		List<NewBook> similarityList=new ArrayList<NewBook>();
		double y=0;
		for (String string : ListStr) 
		{
			y=0;
			int bookID=0;
			 List<NewBook> liste=bookDao.SelectEvaluateByBookname(string.toString());
			 int k=0;
			 for (int i = 0; i <ListLike.size(); i++) 
			 {
				 for (int j = 0; j < liste.size(); j++) 
				 {		
		//if(ListLike.get(i).getBookMC().equals(liste.get(j).getBookMC()))
		if(liste.get(j).getUsersID()==ListLike.get(i).getUsersID())
		{ 
			k++;
			System.out.println("书名: "+liste.get(j).getBookMC());
			System.out.println("***评分1："+ListLike.get(i).getEvaluate());
			System.out.println("***评分2："+liste.get(j).getEvaluate());
			y +=(ListLike.get(i).getEvaluate()-liste.get(j).getEvaluate())*(ListLike.get(i).getEvaluate()-liste.get(j).getEvaluate());
			System.out.println("第"+k+"次评分："+ y);
			bookID=liste.get(j).getBookID();
		}
	}
}
			 if(k>0)
			 {
			 NewBook e=new NewBook();
			 e.setBookMC(string);
			 e.setBookID(bookID);
			 e.setSimilarity(1/(1+ Math.sqrt(y)));
			 similarityList.add(e); 
			System.out.println("书名:"+string+" 评价：" +(1/(1+ Math.sqrt(y)))+"书本ID："+bookID);
			 }
		}
		Collections.sort(similarityList, new Comparator<NewBook>(){
			@Override
			public int compare(NewBook o1, NewBook o2) {
				//按照学生的年龄进行升序排列
				if(o1.getSimilarity() < o2.getSimilarity()){
					return 1;
				}
				if(o1.getSimilarity() == o2.getSimilarity()){
					return 0;
				}
				return -1;
			}
		}); 
		for (NewBook newBook : similarityList) 
		{
		System.out.println(	newBook.getSimilarity());
		}
	}
	
	public static List<String> getUncontain(List<String> list1, List<String> list2){ 
		List<String> Str=new  ArrayList<String>();
        for(String str1 : list1){ 
            if(!list2.contains(str1))
            { 
            	if(str1!=null)
                System.out.println("ArrayList2里没有的是==>" + str1); 
            	Str.add(str1);
            } 
        } 
return Str;
    } 

}
