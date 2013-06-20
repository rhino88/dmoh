package com.psddev.brightspot;

import com.psddev.dari.db.*;
import com.psddev.dari.util.*;
import com.psddev.cms.db.*;
import java.util.*;

@Renderer.LayoutPath("/WEB-INF/layout/homepage-template.jsp")
public class Homepage extends Page {

	@Required
	private String name;
	@Required
	private String pageHeadline;
	private ReferentialText welcomeText;
	private Link promoLink;

	@CollectionMaximum(3)
	@CollectionMinimum(3)
	private List<Article> promoArticles;

	public ReferentialText getWelcomeText(){
		return welcomeText;
	}
	
	public void setWelcomeText(ReferentialText welcomeText){
		this.welcomeText = welcomeText;
	}

	public String getName(){
		return name;
	}
	
	public void setName(String name){
		this.name = name;
	}

	public List<Article> getPromoArticles(){
		return promoArticles;
	}
	
	public void setPromoArticles(List<Article> promoArticles){
		this.promoArticles = promoArticles;
	}

	public String getPageHeadline(){
		return pageHeadline;
	}
	
	public void setPageHeadline(String pageHeadline){
		this.pageHeadline = pageHeadline;
	}

	public Link getPromoLink(){
		return promoLink;
	}
	
	public void setPromoLink(Link promoLink){
		this.promoLink = promoLink;
	}
}