package com.psddev.brightspot;

import com.psddev.dari.db.*;
import com.psddev.dari.util.*;
import com.psddev.cms.db.*;
import java.util.*;
import com.psddev.brightspot.Article;
import com.psddev.dari.db.ObjectType;


@Renderer.LayoutPath("/WEB-INF/layout/section-template.jsp")
@Renderer.Path("/WEB-INF/model/section-object.jsp")
public class Section extends Content implements Directory.Item {

	@Indexed
	@Required
	private String title;
	private ReferentialText	body;
	private Author author;
	@Where("section = ?0")
	private List<Article> articles;



	public List<Article> getArticles(){
		return articles;
	}
	
	public void setArticles(List<Article> articles){
		this.articles = articles;
	}

	public Author getAuthor(){
		return author;
	}
	
	public void setAuthor(Author author){
		this.author = author;
	}


	public ReferentialText getBody(){
		return body;
	}
	
	public void setBody(ReferentialText body){
		this.body = body;
	}


	public String getTitle(){
		return title;
	}
	
	public void setTitle(String title){
		this.title = title;
	}


	@Override
    public String createPermalink(Site site) {

        if (this.getTitle() != null){
            return "/section/" + StringUtils.toNormalized(title);
        } else {
            return null;
        }    
    }


}