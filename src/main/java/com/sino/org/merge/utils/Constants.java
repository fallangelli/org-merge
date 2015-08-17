package com.sino.org.merge.utils;

/**
 * @author lcheng
 * @version 1.0
 *          ${tags}
 */
public class Constants {
    public enum STATE {
        NOMAL("正常合并", 0, "green"),
        ONLY_GR("只在个人树存在", 1, "SteelBlue"),
        ONLY_QY("只在企业树存在", 2, "DeepSkyBlue"),
        ERR_LEVEL("层级不一致", 3, "OrangeRed"),
        ERR_QY_MULT("机构企业名称重复名称", 4, "Brown"),
        ERR_GR_MULT("机构个人名称重复名称", 5, "Brown");


        // 成员变量
        private String name;
        private int index;
        private String color;

        // 构造方法
        private STATE(String name, int index, String color) {
            this.name = name;
            this.index = index;
            this.color = color;
        }

        // 普通方法
        public static String getName(int index) {
            for (STATE c : STATE.values()) {
                if (c.getIndex() == index) {
                    return c.name;
                }
            }
            return null;
        }

        public static String getColor(int index) {
            for (STATE c : STATE.values()) {
                if (c.getIndex() == index) {
                    return c.color;
                }
            }
            return null;
        }

        // get set 方法
        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public int getIndex() {
            return index;
        }

        public void setIndex(int index) {
            this.index = index;
        }

        public String getColor() {
            return color;
        }

        public void setColor(String color) {
            this.color = color;
        }
    }
}
