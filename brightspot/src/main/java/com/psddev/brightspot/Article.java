package com.psddev.brightspot;

import com.psddev.dari.db.*;
import com.psddev.dari.util.*;
import com.psddev.cms.db.*;
import java.util.*;
import com.psddev.brightspot.RightRail;
import com.psddev.dari.db.ObjectType;


@Renderer.LayoutPath("")
@Renderer.Path("/WEB-INF/model/article-object.jsp")
public class Article extends Content implements Directory.Item {

	@Indexed
	@Required
	private String headline;
	@Indexed
	private Author author;
	@ToolUi.Note("Short text snippet to display when article picked for Homepage promo")
	private ReferentialText intro;
	private ReferentialText body;
	private Image image;
	@ToolUi.Heading("Right Rail: Related Content")
	private List<Article> relatedArticles;
	private List<RightRail> rightRailModules;
	@Indexed
	private Section section;


	public Section getSection(){
		return section;
	}
	
	public void setSection(Section section){
		this.section = section;
	}

	
	public List<RightRail> getRightRailModules(){
		return rightRailModules;
	}
	
	public void setRightRailModules(List<RightRail> rightRailModules){
		this.rightRailModules = rightRailModules;
	}
	
	public String getHeadline() {
		return headline;
	}
	public void setHeadline(String headline) {
		this.headline = headline;
	}
	public Author getAuthor() {
		return author;
	}
	public void setAuthor(Author author) {
		this.author = author;
	}

	public ReferentialText getIntro(){
		return intro;
	}
	
	public void setIntro(ReferentialText intro){
		this.intro = intro;
	}
	public ReferentialText getBody() {
		return body;
	}
	public void setBody(ReferentialText body) {
		this.body = body;
	}

	public Image getImage(){
		return image;
	}
	
	public void setImage(Image image){
		this.image = image;
	}


	public List<Article> getRelatedArticles(){
		return relatedArticles;
	}
	
	public void setRelatedArticles(List<Article> relatedArticles){
		this.relatedArticles = relatedArticles;
	}



	@Override
    public String createPermalink(Site site) {

        if (this.getHeadline() != null){
            return "/article/" + StringUtils.toNormalized(headline);
        } else {
            return null;
        }    
    }


}