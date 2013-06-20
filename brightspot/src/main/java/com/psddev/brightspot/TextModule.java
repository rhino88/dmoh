package com.psddev.brightspot;

import com.psddev.dari.db.*;
import com.psddev.dari.util.*;
import com.psddev.cms.db.*;
import java.util.*;

@Renderer.Path("/WEB-INF/modules/text-module.jsp")
public class TextModule extends Content implements RightRail {

	private String name;
	private ReferentialText text;

	public String getName(){
		return name;
	}
	
	public void setName(String name){
		this.name = name;
	}

	public ReferentialText getText(){
		return text;
	}
	
	public void setText(ReferentialText text){
		this.text = text;
	}
}