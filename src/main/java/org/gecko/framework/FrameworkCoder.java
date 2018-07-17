package org.gecko.framework;

import org.gecko.generator.config.GeckoGenConfigure;
import org.gecko.generator.core.GeckoCodeGenerator;
import org.gecko.common.db.IDBDescriptor;
import org.gecko.common.db.OracleDescriptor;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

//
public class FrameworkCoder {

    public FrameworkCoder() {
    }

    public static void main(String[] args) {
        //System.setProperty("user.dir", "/Users/Sunris/git/gecko/gecko-security");

        GeckoGenConfigure config = new GeckoGenConfigure("org.gecko.framework", "ent", "企业信息表");
        //config.setBasePath("/Users/Sunris/git/gecko/gecko-security");
        config.setAnalyser(GeckoGenConfigure.Analyzer.DATABASE);
        config.setAuthor("Gecko Generator");
        config.setEmail("admin@aisino.com");



        String database = "winelabels", dbUrl = "jdbc:oracle:thin:@localhost:1521:orcl";
        String user = "winelabels", password = "root";
        IDBDescriptor descriptor = new OracleDescriptor(database, "oracle.jdbc.driver.OracleDriver", dbUrl, user, password);
        config.setDbDescriptor(descriptor);
        //config.setExecuteSql(true);//提交修改

        config.overwrite(GeckoGenConfigure.Model.CONTROLLER);
        config.overwrite(GeckoGenConfigure.Model.SERVICE);
        config.overwrite(GeckoGenConfigure.Model.DAO);
        config.overwrite(GeckoGenConfigure.Model.MAPPER);
        config.overwrite(GeckoGenConfigure.Model.TESTCASE);
        config.overwrite(GeckoGenConfigure.Model.ENTITY);
        config.overwrite(GeckoGenConfigure.Model.SQL);
        //config.overwrite(GeckoGenConfigure.Model.HTML);


//        config.ignore(GeckoGenConfigure.Model.CONTROLLER);
//        config.ignore(GeckoGenConfigure.Model.SERVICE);
//        config.ignore(GeckoGenConfigure.Model.DAO);
//        config.ignore(GeckoGenConfigure.Model.SQL);
//        //config.ignore(GeckoGenConfigure.Model.MAPPER);
//        config.ignore(GeckoGenConfigure.Model.TESTCASE);
//        config.ignore(GeckoGenConfigure.Model.ENTITY);
//        config.ignore(GeckoGenConfigure.Model.HTML);
        List<String> tableNames = new ArrayList<>();
        tableNames.add("ENT_ENTBASIC");

        config.setEntities(tableNames);
        //来源数据库o

        try {
            //config.setTargetDbDescriptor(new MySqlDescriptor());//target database
            config.setTargetDbDescriptor(new OracleDescriptor());
            new GeckoCodeGenerator(config).generateAll();

//            for (Map.Entry<String, String> entry : map.entrySet()) {
//                config.setEntityName(entry.getKey());
//                config.setEntityDescription(entry.getValue());
//            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}