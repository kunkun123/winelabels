package org.gecko.framework.system.entity.base;

import org.gecko.annotations.GeckoField;
import org.gecko.framework.base.BaseEntity;

/**
 * 
 * AbstractDuty
 * 职务
 * @author Gecko Generator
 * @email admin@aisino.com
 * @date 2017-08-25 14:12:26 
 *
 */
public abstract class AbstractDuty extends BaseEntity {
	
	private static final long serialVersionUID = 1L;
	
	@GeckoField(primarykey=true,fieldType = GeckoField.FieldType.STRING, length = 32, nullable = false, description = "主键(primary key)", searchable = false)
    private String id;

    public void setId(String id){
        this.id = id;
    }

    public String getId(){
        return this.id;
    }

    @Override
    public String toString() {
        return "AbstractDuty{" +
                "id='" + id + '\'' +
                '}';
    }
}
