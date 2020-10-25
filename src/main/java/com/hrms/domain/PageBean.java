package com.hrms.domain;

import java.util.List;

public class PageBean<T> {

    /**
     * 总页面数
     */
    private Integer totalPages;
    /**
     * 总记录数
     */
    private Integer totalCount;
    /**
     * 当前页
     */
    private Integer currPage;
    /**
     * 每页显示的记录条数
     */
    private Integer pageSize;
    /**
     * 每页显示的数据
     */
    private List<T> list;
    /**
     * 模糊查询条件
     */
    private String condition;

    /**
     * get and set 方法
     *
     * @return
     */


    public Integer getTotalPages() {
        return totalPages;
    }


    public String getCondition() {
        return condition;
    }

    public void setCondition(String condition) {
        this.condition = condition;
    }

    public void setTotalPages(Integer totalPages) {
        this.totalPages = totalPages;
    }

    public Integer getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(Integer totalCount) {
        this.totalCount = totalCount;
    }

    public Integer getCurrPage() {
        return currPage;
    }

    public void setCurrPage(Integer currPage) {
        this.currPage = currPage;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }


    /**
     * toString 方法
     *
     * @return
     */
    @Override
    public String toString() {
        return "PageBean{" +
                "totalPages=" + totalPages +
                ", totalCount=" + totalCount +
                ", currPage=" + currPage +
                ", pageSize=" + pageSize +
                ", list=" + list +
                '}';
    }
}
