package com.psddev.brightspot;

import com.psddev.dari.db.*;
import com.psddev.dari.util.*;
import com.psddev.cms.db.*;
import java.util.*;

@Renderer.LayoutPath("")
@Renderer.Path("/WEB-INF/modules/featured-author.jsp")
public class FeaturedAuthor extends Content {

	private String name;
	private Author featuredAuthor;


	public Author getFeaturedAuthor(){
		return featuredAuthor;
	}
	
	public void setFeaturedAuthor(Author featuredAuthor){
		this.featuredAuthor = featuredAuthor;
	}

	public String getName(){
		return name;
	}
	
	public void setName(String name){
		this.name = name;
	}

}