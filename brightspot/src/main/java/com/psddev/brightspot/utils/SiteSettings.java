package com.psddev.brightspot;

import com.psddev.dari.db.*;
import com.psddev.dari.util.*;
import com.psddev.cms.db.*;
import java.util.*;
import com.psddev.brightspot.RightRail;
import com.psddev.dari.db.ObjectType;
import com.psddev.cms.tool.Tool;

public class SiteSettings extends Tool {

    private String googleAnalyticsId;
    private String copyrightText;
    private String globalNavigation;
    @ToolUi.Note("ijdfdlasjdlasjdalsdjalsdjaslidjasl")
    @ToolUi.Tab("Navigation")
    private Author author;


    public String getCopyrightText(){
    	return copyrightText;
    }
    
    public void setCopyrightText(String copyrightText){
    	this.copyrightText = copyrightText;
    }

    public String getGlobalNavigation(){
    	return globalNavigation;
    }
    
    public void setGlobalNavigation(String globalNavigation){
    	this.globalNavigation = globalNavigation;
    }
     
    public String getGoogleAnalyticsId(){
        return googleAnalyticsId;
    }
    
    public void setGoogleAnalyticsId(String googleAnalyticsId){
        this.googleAnalyticsId = googleAnalyticsId;
    }

}
