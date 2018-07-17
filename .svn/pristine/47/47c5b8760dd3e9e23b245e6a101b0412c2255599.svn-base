package org.gecko.framework.system.entity;

import org.gecko.annotations.GeckoField;
import org.gecko.framework.system.entity.base.AbstractDemo;
import org.gecko.framework.system.entity.enums.Gender;

/**
 * 测试专用
 *
 * @author ZhuXG
 */
public class Demo extends AbstractDemo {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1884028020869032217L;

	@GeckoField(description = "名称", searchable = true)
    private String name;

    @GeckoField(description = "性别", editableType = "select", htmlType = "text")
    private Gender gender;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Gender getGender() {
        return gender;
    }

    public void setGender(Gender gender) {
        this.gender = gender;
    }
}
