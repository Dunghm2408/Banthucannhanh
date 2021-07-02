using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Ps12922_HoManhDung_ASM.Models;
using Ps12922_HoManhDung_ASM.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Ps12922_HoManhDung_ASM.Controllers
{
    public class DonhangController : BaseController
    {
        // GET:KhachhangController
        private IDonhangSvc _donhangSvc;

        public DonhangController(IDonhangSvc donhangSvc)
        {
            _donhangSvc = donhangSvc;
        }

        // GET: MonAnController
        public ActionResult Index()
        {
            return View(_donhangSvc.GetDonhangAll());
        }

        // GET: KhachhangController/Details/5
        public ActionResult Details(int id)
        {
            return View(_donhangSvc.GetDonhang(id));
        }

        // GET: KhachhangController/Edit/5
        public ActionResult Edit(int id)
        {
            var donhang = _donhangSvc.GetDonhang(id);
            return View(donhang);

        }

        // POST: KhachhangController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, Donhang donhang)
        {
            try
            {
                donhang.Khachhang = null;
                _donhangSvc.EditDonhang(id, donhang);
                return RedirectToAction(nameof(Details), new { id = donhang.DonhangID });
            }
            catch
            {
                return View();
            }
        }    
     }
}
