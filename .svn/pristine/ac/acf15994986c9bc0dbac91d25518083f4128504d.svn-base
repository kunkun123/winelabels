package org.gecko.framework.pubdata.entity.base;

import org.gecko.framework.base.BaseEntity;
import org.gecko.annotations.GeckoField;
import org.gecko.annotations.GeckoField.FieldType;

/**
 * 
 * AbstractPubBaseinfoSyspost
 * 职务管理
 * @author Gecko Generator
 * @email admin@aisino.com
 * @date 2017-10-13 11:35:37 
 *
 */
public abstract class AbstractPubBaseinfoSyspost extends BaseEntity {
	
	private static final long serialVersionUID = 1L;
	
	@GeckoField(primarykey=true,fieldType = GeckoField.FieldType.BIGDECIMAL, length = 22, nullable = false, description = "id", searchable = true)
    private java.math.BigDecimal id;

    @GeckoField(fieldType = GeckoField.FieldType.BIGDECIMAL, length = 22, nullable = true, description = "是否领导", searchable = true)
    private java.math.BigDecimal isleader;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 60, nullable = true, description = "资源ID", searchable = true)
    private String sourceid;
    
    @GeckoField(fieldType = GeckoField.FieldType.BIGDECIMAL, length = 22, nullable = true, description = "所属单位", searchable = true)
    private java.math.BigDecimal unitnum;
    
    @GeckoField(fieldType = GeckoField.FieldType.BIGDATA, length = 4000, nullable = true, description = "职务描述", searchable = true)
    private java.sql.Clob postdesc;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 60, nullable = true, description = "职位编号", searchable = true)
    private String postnum;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 100, nullable = true, description = "职务名称", searchable = true)
    private String postname;
    
    public void setIsleader(java.math.BigDecimal isleader){
        this.isleader = isleader;
    }

    public java.math.BigDecimal getIsleader(){
        return this.isleader;
    }
    
    public void setSourceid(String sourceid){
        this.sourceid = sourceid;
    }

    public String getSourceid(){
        return this.sourceid;
    }
    
    public void setUnitnum(java.math.BigDecimal unitnum){
        this.unitnum = unitnum;
    }

    public java.math.BigDecimal getUnitnum(){
        return this.unitnum;
    }
    
    public void setPostdesc(java.sql.Clob postdesc){
        this.postdesc = postdesc;
    }

    public java.sql.Clob getPostdesc(){
        return this.postdesc;
    }
    
    public void setPostnum(String postnum){
        this.postnum = postnum;
    }

    public String getPostnum(){
        return this.postnum;
    }
    
    public void setPostname(String postname){
        this.postname = postname;
    }

    public String getPostname(){
        return this.postname;
    }
    
    public void setId(java.math.BigDecimal id){
        this.id = id;
    }

    public java.math.BigDecimal getId(){
        return this.id;
    }

    @Override
    public String toString() {
        return "AbstractPubBaseinfoSyspost{" +
                "id='" + id + '\'' +
                ", isleader=" + isleader +
                ", sourceid=" + sourceid +
                ", unitnum=" + unitnum +
                ", postdesc=" + postdesc +
                ", postnum=" + postnum +
                ", postname=" + postname +
                '}';
    }
}
