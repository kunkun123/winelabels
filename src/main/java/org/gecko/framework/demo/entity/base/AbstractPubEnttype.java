package org.gecko.framework.demo.entity.base;

import org.gecko.framework.base.BaseEntity;
import org.gecko.annotations.GeckoField;
import org.gecko.annotations.GeckoField.FieldType;

/**
 * 
 * AbstractPubEnttype
 * PUB_ENTTYPE
 * @author Gecko Generator
 * @email admin@aisino.com
 * @date 2017-09-08 21:51:45 
 *
 */
public abstract class AbstractPubEnttype extends BaseEntity {
	
	private static final long serialVersionUID = 1L;
	
	@GeckoField(primarykey=true,fieldType = GeckoField.FieldType.BIGDECIMAL, length = 22, nullable = false, description = "", searchable = true)
    private java.math.BigDecimal id;

    @GeckoField(fieldType = GeckoField.FieldType.BIGDECIMAL, length = 22, nullable = true, description = "", searchable = true)
    private java.math.BigDecimal groupid;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 30, nullable = true, description = "", searchable = true)
    private String enttypenum;
    
    @GeckoField(fieldType = GeckoField.FieldType.BIGDECIMAL, length = 22, nullable = true, description = "", searchable = true)
    private java.math.BigDecimal parententtype;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 30, nullable = true, description = "", searchable = true)
    private String sourceid;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 30, nullable = true, description = "", searchable = true)
    private String enttypename;
    
    @GeckoField(fieldType = GeckoField.FieldType.BIGDECIMAL, length = 22, nullable = true, description = "", searchable = true)
    private java.math.BigDecimal creator;
    
    public void setGroupid(java.math.BigDecimal groupid){
        this.groupid = groupid;
    }

    public java.math.BigDecimal getGroupid(){
        return this.groupid;
    }
    
    public void setEnttypenum(String enttypenum){
        this.enttypenum = enttypenum;
    }

    public String getEnttypenum(){
        return this.enttypenum;
    }
    
    public void setParententtype(java.math.BigDecimal parententtype){
        this.parententtype = parententtype;
    }

    public java.math.BigDecimal getParententtype(){
        return this.parententtype;
    }
    
    public void setSourceid(String sourceid){
        this.sourceid = sourceid;
    }

    public String getSourceid(){
        return this.sourceid;
    }
    
    public void setEnttypename(String enttypename){
        this.enttypename = enttypename;
    }

    public String getEnttypename(){
        return this.enttypename;
    }
    
    public void setCreator(java.math.BigDecimal creator){
        this.creator = creator;
    }

    public java.math.BigDecimal getCreator(){
        return this.creator;
    }
    
    public void setId(java.math.BigDecimal id){
        this.id = id;
    }

    public java.math.BigDecimal getId(){
        return this.id;
    }

    @Override
    public String toString() {
        return "AbstractPubEnttype{" +
                "id='" + id + '\'' +
                ", groupid=" + groupid +
                ", enttypenum=" + enttypenum +
                ", parententtype=" + parententtype +
                ", sourceid=" + sourceid +
                ", enttypename=" + enttypename +
                ", creator=" + creator +
                '}';
    }
}
