﻿using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.AspNetCore.Routing;
using Ps12922_HoManhDung_ASM.Constant;

namespace Ps12922_HoManhDung_ASM.Filters
{
    public class AuthenticationFilterAttribute : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            // The action filter logic.
            Controller controller = filterContext.Controller as Controller;
            var session = filterContext.HttpContext.Session;
            string userName = filterContext.HttpContext.Session.GetString(SessionKey.Nguoidung.UserName);
            var sessionStatus = ((userName != null && userName != "") ? true : false);
            if (controller != null)
            {
                if (session == null || !sessionStatus)
                {
                    filterContext.Result =
                           new RedirectToRouteResult(
                               new RouteValueDictionary{
                                   { "controller", "Admin" },
                                   { "action", "Login" }}
                               );

                }
            }
            base.OnActionExecuting(filterContext);
        }
    }
    public class AuthenticationFilterAttribute_KH : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            // The action filter logic.
            Controller controller = filterContext.Controller as Controller;
            var session = filterContext.HttpContext.Session;
            string kH_Email = filterContext.HttpContext.Session.GetString(SessionKey.Khachhang.KH_Email);
            var sessionStatus = ((kH_Email != null && kH_Email != "") ? true : false);
            if (controller != null)
            {
                if (session == null || !sessionStatus)
                {
                    filterContext.Result = new RedirectToRouteResult(
                               new RouteValueDictionary{
                                   { "controller", "Home" },
                                   { "action", "Login" }}
                               );
                }
            }
            base.OnActionExecuting(filterContext);
        }
    }
}