using Ps12922_HoManhDung_ASM.Helpers;
using Ps12922_HoManhDung_ASM.Models;
using Ps12922_HoManhDung_ASM.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Ps12922_HoManhDung_ASM.Services
{
    public interface INguoidungSvc
    {
        List<Nguoidung> GetNguoidungAll();
        Nguoidung GetNguoidung(int id);
        int AddNguoidung(Nguoidung nguoidung);
        int EditNguoidung(int id, Nguoidung nguoidung);
        public Nguoidung Login(ViewLogin viewLogin);
    }
    public class NguoidungSvc : INguoidungSvc
    {
        protected DataContext _context;
        protected IMahoaHelper _mahoaHelper;
        public NguoidungSvc(DataContext context, IMahoaHelper mahoaHelper)
        {
            _context = context;
            _mahoaHelper = mahoaHelper;
        }
        public List<Nguoidung> GetNguoidungAll()
        {
            List<Nguoidung> list = new List<Nguoidung>();
            list = _context.Nguoidungs.ToList();
            return list;
        }
        public Nguoidung GetNguoidung(int id)
        {
            Nguoidung nguoidung = null;
            nguoidung = _context.Nguoidungs.Find(id);//cách này chỉ dùng cho Khóa chính
            //product = _context.Products.Where(e=>e.Id==id).FirstOrDefault(); //cách tổng quát
            return nguoidung;
        }
        public int AddNguoidung(Nguoidung nguoidung)
        {
            int ret = 0;
            try
            {
                nguoidung.Password = _mahoaHelper.Mahoa(nguoidung.Password);
                _context.Add(nguoidung);
                _context.SaveChanges();
                ret = nguoidung.NguoidungID;
            }
            catch
            {
                ret = 0;
            }
            return ret;
        }
        public int EditNguoidung(int id, Nguoidung nguoidung)
        {
            int ret = 0;
            try
            {
                Nguoidung _nguoidung = null;
                _nguoidung = _context.Nguoidungs.Find(id);
                _nguoidung.UserName = _nguoidung.UserName;
                _nguoidung.FullName = _nguoidung.FullName;
                _nguoidung.Title = _nguoidung.Title;
                _nguoidung.DOB = _nguoidung.DOB;
                _nguoidung.Email = _nguoidung.Email;
                _nguoidung.Admin = _nguoidung.Admin;
                _nguoidung.Locked = _nguoidung.Locked;
                if(nguoidung.Password != null)
                {
                    nguoidung.Password = _mahoaHelper.Mahoa(nguoidung.Password);
                    _nguoidung.Password = nguoidung.Password;
                }
                _context.Update(_nguoidung);
                _context.SaveChanges();
                ret = nguoidung.NguoidungID;
            }
            catch
            {
                ret = 0;
            }
            return ret;
        }
        public Nguoidung Login(ViewLogin viewLogin)
        {
            var u = _context.Nguoidungs.Where(
                p => p.UserName.Equals(viewLogin.UserName)
                && p.Password.Equals(_mahoaHelper.Mahoa(viewLogin.Password))
                ).FirstOrDefault();
            return u;
        }
    }
}
