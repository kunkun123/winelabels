package org.gecko.framework.pubdata.entity.base;

import org.gecko.framework.base.BaseEntity;
import org.gecko.annotations.GeckoField;
import org.gecko.annotations.GeckoField.FieldType;

/**
 * 
 * AbstractPubBaseinfoSysarea
 * 地区街道
 * @author Gecko Generator
 * @email admin@aisino.com
 * @date 2017-10-12 16:58:55 
 *
 */
public abstract class AbstractPubBaseinfoSysarea extends BaseEntity {
	
	private static final long serialVersionUID = 1L;
	
	@GeckoField(primarykey=true,fieldType = GeckoField.FieldType.BIGDECIMAL, length = 22, nullable = false, description = "id", searchable = true)
    private java.math.BigDecimal id;

    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 30, nullable = true, description = "地区街道类型", searchable = true)
    private String arealevel;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 300, nullable = true, description = "地区街道名称", searchable = true)
    private String areaname;
    
    @GeckoField(fieldType = GeckoField.FieldType.BIGDECIMAL, length = 22, nullable = true, description = "父级地区", searchable = true)
    private java.math.BigDecimal parentarea;
    
    @GeckoField(fieldType = GeckoField.FieldType.BIGDATA, length = 4000, nullable = true, description = "备注", searchable = true)
    private java.sql.Clob remark;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 30, nullable = true, description = "地区街道编号", searchable = true)
    private String areanum;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 30, nullable = true, description = "地区街道类型", searchable = true)
    private String arealevelname;
    
    @GeckoField(fieldType = GeckoField.FieldType.STRING, length = 60, nullable = true, description = "资源ID", searchable = true)
    private String sourceid;
    
    public void setArealevel(String arealevel){
        this.arealevel = arealevel;
    }

    public String getArealevel(){
        return this.arealevel;
    }
    
    public void setAreaname(String areaname){
        this.areaname = areaname;
    }

    public String getAreaname(){
        return this.areaname;
    }
    
    public void setParentarea(java.math.BigDecimal parentarea){
        this.parentarea = parentarea;
    }

    public java.math.BigDecimal getParentarea(){
        return this.parentarea;
    }
    
    public void setRemark(java.sql.Clob remark){
        this.remark = remark;
    }

    public java.sql.Clob getRemark(){
        return this.remark;
    }
    
    public void setAreanum(String areanum){
        this.areanum = areanum;
    }

    public String getAreanum(){
        return this.areanum;
    }
    
    public void setArealevelname(String arealevelname){
        this.arealevelname = arealevelname;
    }

    public String getArealevelname(){
        return this.arealevelname;
    }
    
    public void setSourceid(String sourceid){
        this.sourceid = sourceid;
    }

    public String getSourceid(){
        return this.sourceid;
    }
    
    public void setId(java.math.BigDecimal id){
        this.id = id;
    }

    public java.math.BigDecimal getId(){
        return this.id;
    }

    @Override
    public String toString() {
        return "AbstractPubBaseinfoSysarea{" +
                "id='" + id + '\'' +
                ", arealevel=" + arealevel +
                ", areaname=" + areaname +
                ", parentarea=" + parentarea +
                ", remark=" + remark +
                ", areanum=" + areanum +
                ", arealevelname=" + arealevelname +
                ", sourceid=" + sourceid +
                '}';
    }
}
