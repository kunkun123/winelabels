package org.gecko.framework.notice.entity.base;

import org.gecko.framework.base.BaseEntity;
import org.gecko.annotations.GeckoField;
import org.gecko.annotations.GeckoField.FieldType;

/**
 * 
 * AbstractMgNotice
 * MG_NOTICE
 * @author Gecko Generator
 * @email admin@aisino.com
 * @date 2018-01-04 14:30:33 
 *
 */
public abstract class AbstractMgNotice extends BaseEntity {
	
	private static final long serialVersionUID = 1L;
	
	@GeckoField(primarykey=true,fieldType = GeckoField.FieldType.BIGDECIMAL, length = 22, nullable = false, description = "", searchable = true)
    private java.math.BigDecimal id;

    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 20, nullable = true, description = "", searchable = true)
    private String serialno;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 200, nullable = true, description = "", searchable = true)
    private String title;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 2000, nullable = true, description = "", searchable = true)
    private String content;
    
    @GeckoField(fieldType = GeckoField.FieldType.DATE, length = 7, nullable = true, description = "", searchable = true)
    private java.sql.Date publicdate;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 2, nullable = true, description = "", searchable = true)
    private String ispub;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 5, nullable = true, description = "", searchable = true)
    private String scope;
    
    @GeckoField(fieldType = GeckoField.FieldType.DATE, length = 7, nullable = true, description = "", searchable = true)
    private java.sql.Date lastupdatetime;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 200, nullable = true, description = "", searchable = true)
    private String temp1;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 200, nullable = true, description = "", searchable = true)
    private String temp2;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 100, nullable = true, description = "", searchable = true)
    private String attachurl;
    
    public void setSerialno(String serialno){
        this.serialno = serialno;
    }

    public String getSerialno(){
        return this.serialno;
    }
    
    public void setTitle(String title){
        this.title = title;
    }

    public String getTitle(){
        return this.title;
    }
    
    public void setContent(String content){
        this.content = content;
    }

    public String getContent(){
        return this.content;
    }
    
    public void setPublicdate(java.sql.Date publicdate){
        this.publicdate = publicdate;
    }

    public java.sql.Date getPublicdate(){
        return this.publicdate;
    }
    
    public void setIspub(String ispub){
        this.ispub = ispub;
    }

    public String getIspub(){
        return this.ispub;
    }
    
    public void setScope(String scope){
        this.scope = scope;
    }

    public String getScope(){
        return this.scope;
    }
    
    public void setLastupdatetime(java.sql.Date lastupdatetime){
        this.lastupdatetime = lastupdatetime;
    }

    public java.sql.Date getLastupdatetime(){
        return this.lastupdatetime;
    }
    
    public void setTemp1(String temp1){
        this.temp1 = temp1;
    }

    public String getTemp1(){
        return this.temp1;
    }
    
    public void setTemp2(String temp2){
        this.temp2 = temp2;
    }

    public String getTemp2(){
        return this.temp2;
    }
    
    public void setAttachurl(String attachurl){
        this.attachurl = attachurl;
    }

    public String getAttachurl(){
        return this.attachurl;
    }
    
    public void setId(java.math.BigDecimal id){
        this.id = id;
    }

    public java.math.BigDecimal getId(){
        return this.id;
    }

    @Override
    public String toString() {
        return "AbstractMgNotice{" +
                "id='" + id + '\'' +
                ", serialno=" + serialno +
                ", title=" + title +
                ", content=" + content +
                ", publicdate=" + publicdate +
                ", ispub=" + ispub +
                ", scope=" + scope +
                ", lastupdatetime=" + lastupdatetime +
                ", temp1=" + temp1 +
                ", temp2=" + temp2 +
                ", attachurl=" + attachurl +
                '}';
    }
}
