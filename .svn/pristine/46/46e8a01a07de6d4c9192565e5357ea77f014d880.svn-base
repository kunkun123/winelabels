package org.gecko.framework.system.entity.base;

import org.gecko.framework.base.BaseEntity;
import org.gecko.annotations.GeckoField;
import org.gecko.annotations.GeckoField.FieldType;

/**
 * AbstractDemo
 * 测试专用
 *
 * @author Gecko Generator
 * @email admin@aisino.com
 * @date 2017-09-01 17:36:19
 */
public abstract class AbstractDemo extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @GeckoField(primarykey = true, fieldType = FieldType.STRING, length = 32, nullable = false, description = "主键(primary key)", searchable = false)
    private String id;


    public void setId(String id) {
        this.id = id;
    }

    public String getId() {
        return this.id;
    }

    @Override
    public String toString() {
        return "AbstractDemo{" +
                "id='" + id + '\'' +
                '}';
    }
}
