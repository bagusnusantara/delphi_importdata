unit import;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZAbstractConnection, ZConnection,comobj;

type
  TForm1 = class(TForm)
    ZConnection1: TZConnection;
    q1: TZQuery;
    openFile: TButton;
    Label1: TLabel;
    od1: TOpenDialog;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    edt_import: TEdit;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    procedure openFileClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.openFileClick(Sender: TObject);
begin
     if od1.Execute then
     edt_import.Text:=od1.FileName;
end;

procedure TForm1.Button1Click(Sender: TObject);
var ExcelApp: OleVariant;
    Sheet: Variant;
    i:integer;

begin
  if MessageBox (Handle, 'Anda yakin untuk mengimport data  ?', 'Confirmation',
    MB_OKCANCEL or MB_ICONINFORMATION) = mrOK then
    begin

    ExcelApp := CreateOLEObject('Excel.Application');
    ExcelApp.Workbooks.Open[trim(edt_import.Text)];

    Sheet := ExcelApp.Workbooks[1].Worksheets[1];


    i:=4;

    repeat
    i:=i+1;
    if Trim(sheet.cells[i,1])<>'' then
       begin
          with q1 do
            begin
              sql.clear;
              sql.add('select vendor from ven_loc where vendor=:vendor');
              parambyname('vendor').value:=Trim(sheet.cells[i,1]);
              open;
              if recordcount=0 then
                 begin


                    with q1 do
                      begin
                        sql.clear;
                        sql.add('insert into ven_loc ');
                        sql.add('(vendor,st_country_kode,ven_loc_name,ven_loc_addr1,phone,city,id_company,st_payment_kode,st_delivery_transport_kode,st_delivery_kode,st_currency_kode)');
                        sql.add('values(:vendor,:st_country_kode,:ven_loc_name,:ven_loc_addr1,:phone,:city,:id_company,:st_payment_kode,:st_delivery_transport_kode,:st_delivery_kode,:st_currency_kode)');
                        parambyname('vendor').value:=Trim(sheet.cells[i,1]);
                        parambyname('st_country_kode').value:=Trim(sheet.cells[i,2]);
                        parambyname('ven_loc_name').value:=Trim(sheet.cells[i,3]);
                        parambyname('ven_loc_addr1').value:=Trim(sheet.cells[i,4]);
                        parambyname('phone').value:=Trim(sheet.cells[i,5]);
                        parambyname('city').value:=Trim(sheet.cells[i,6]);
                        parambyname('id_company').value:=Trim(sheet.cells[i,7]);
                        parambyname('st_payment_kode').value:=Trim(sheet.cells[i,8]);
                        parambyname('st_delivery_transport_kode').value:=Trim(sheet.cells[i,9]);
                        parambyname('st_delivery_kode').value:=Trim(sheet.cells[i,10]);
                        parambyname('st_currency_kode').value:=Trim(sheet.cells[i,11]);
                        try
                          execSQL;

                        except
                          showmessage('Error Insert');
                        end;
                      end;
                 end;
            end;
       end;


    until (Trim(sheet.cells[i+1,1])='') AND (Trim(sheet.cells[i+2,1])='');
    showmessage('Import Data Berhasil');
    end;

end;

procedure TForm1.Button2Click(Sender: TObject);
var ExcelApp: OleVariant;
    Sheet: Variant;
    i:integer;

begin
  if MessageBox (Handle, 'Anda yakin untuk mengimport data  ?', 'Confirmation',
    MB_OKCANCEL or MB_ICONINFORMATION) = mrOK then
    begin

    ExcelApp := CreateOLEObject('Excel.Application');
    ExcelApp.Workbooks.Open[trim(edt_import.Text)];

    Sheet := ExcelApp.Workbooks[1].Worksheets[1];


    i:=4;

    repeat
    i:=i+1;
    if Trim(sheet.cells[i,1])<>'' then
       begin
          with q1 do
            begin
              sql.clear;
              sql.add('select customer from customer where customer=:customer');
              parambyname('customer').value:=Trim(sheet.cells[i,1]);
              open;
              if recordcount=0 then
                 begin


                    with q1 do
                      begin
                        sql.clear;
                        sql.add('insert into customer ');
                        sql.add('(customer,customer_name,customer_addr1,customer_phone,customer_country,id_company,st_payment_kode,st_delivery_transport_kode,st_delivery_kode,st_currency_kode_default)');
                        sql.add('values(:customer,:customer_name,:customer_addr1,:customer_phone,:customer_country,:id_company,:st_payment_kode,:st_delivery_transport_kode,:st_delivery_kode,:st_currency_kode_default)');
                        parambyname('customer').value:=Trim(sheet.cells[i,1]);
                        parambyname('customer_name').value:=Trim(sheet.cells[i,2]);
                        parambyname('customer_addr1').value:=Trim(sheet.cells[i,3]);
                        parambyname('customer_phone').value:=Trim(sheet.cells[i,4]);
                        parambyname('customer_country').value:=Trim(sheet.cells[i,5]);
                        parambyname('id_company').value:=Trim(sheet.cells[i,6]);
                        parambyname('st_payment_kode').value:=Trim(sheet.cells[i,7]);
                        parambyname('st_delivery_transport_kode').value:=Trim(sheet.cells[i,8]);
                        parambyname('st_delivery_kode').value:=Trim(sheet.cells[i,9]);
                        parambyname('st_currency_kode_default').value:=Trim(sheet.cells[i,10]);
                        try
                          execSQL;

                        except
                          showmessage('Error Insert');
                        end;
                      end;
                 end;
            end;
       end;


    until (Trim(sheet.cells[i+1,1])='') AND (Trim(sheet.cells[i+2,1])='');
    showmessage('Import Data Berhasil');
    end;
    end;

procedure TForm1.Button4Click(Sender: TObject);
begin
 close;
end;

procedure TForm1.Button3Click(Sender: TObject);
var ExcelApp: OleVariant;
    Sheet: Variant;
    i:integer;

begin
  if MessageBox (Handle, 'Anda yakin untuk mengimport data  ?', 'Confirmation',
    MB_OKCANCEL or MB_ICONINFORMATION) = mrOK then
    begin

    ExcelApp := CreateOLEObject('Excel.Application');
    ExcelApp.Workbooks.Open[trim(edt_import.Text)];

    Sheet := ExcelApp.Workbooks[1].Worksheets[1];


    i:=4;

    repeat
    i:=i+1;
    if Trim(sheet.cells[i,1])<>'' then
       begin
          with q1 do
            begin
              sql.clear;
              sql.add('select kode from item_planning where kode=:kode');
              parambyname('kode').value:=Trim(sheet.cells[i,1]);
              open;
              if recordcount=0 then
                 begin


                    with q1 do
                      begin
                        sql.clear;
                        sql.add('insert into item_planning');
                        sql.add('(kode,st_um_kode,deskripsi,min_stock,maks_stock,item_planning_jns_kode,min_order_qty,maks_order_qty,multiple_order_qty,kapasitas_perhari,batch_size,lite_time,id_jenis,id_company,ajl_fjl,id_nonaktif)');
                        sql.add('values(:kode,:st_um_kode,:deskripsi,:min_stock,:maks_stock,:item_planning_jns_kode,:min_order_qty,:maks_order_qty,:multiple_order_qty,:kapasitas_perhari,:batch_size,:lite_time,:id_jenis,:id_company,:ajl_fjl,:id_nonaktif)');
                        parambyname('kode').value:=Trim(sheet.cells[i,1]);
                        parambyname('st_um_kode').value:=Trim(sheet.cells[i,2]);
                        parambyname('deskripsi').value:=Trim(sheet.cells[i,3]);
                        parambyname('min_stock').value:=Trim(sheet.cells[i,4]);
                        parambyname('maks_stock').value:=Trim(sheet.cells[i,5]);
                        parambyname('item_planning_jns_kode').value:=Trim(sheet.cells[i,6]);
                        parambyname('min_order_qty').value:=Trim(sheet.cells[i,7]);
                        parambyname('maks_order_qty').value:=Trim(sheet.cells[i,8]);
                        parambyname('multiple_order_qty').value:=Trim(sheet.cells[i,9]);
                        parambyname('kapasitas_perhari').value:=Trim(sheet.cells[i,10]);
                        parambyname('batch_size').value:=Trim(sheet.cells[i,11]);
                        parambyname('lite_time').value:=Trim(sheet.cells[i,12]);
                        parambyname('id_jenis').value:=Trim(sheet.cells[i,13]);
                        parambyname('id_company').value:=Trim(sheet.cells[i,14]);
                        parambyname('ajl_fjl').value:=Trim(sheet.cells[i,15]);
                        parambyname('id_nonaktif').value:=Trim(sheet.cells[i,16]);
                        try
                          execSQL;

                        except
                          showmessage('Error Insert');
                        end;
                      end;
                 end;
            end;
       end;


    until (Trim(sheet.cells[i+1,1])='') AND (Trim(sheet.cells[i+2,1])='');
    showmessage('Import Data Berhasil');
    end;
    end;


procedure TForm1.Button5Click(Sender: TObject);
var ExcelApp: OleVariant;
    Sheet: Variant;
    i:integer;

begin
  if MessageBox (Handle, 'Anda yakin untuk mengimport data  ?', 'Confirmation',
    MB_OKCANCEL or MB_ICONINFORMATION) = mrOK then
    begin

    ExcelApp := CreateOLEObject('Excel.Application');
    ExcelApp.Workbooks.Open[trim(edt_import.Text)];

    Sheet := ExcelApp.Workbooks[1].Worksheets[1];


    i:=4;

    repeat
    i:=i+1;
    if Trim(sheet.cells[i,1])<>'' then
       begin
          with q1 do
            begin
              sql.clear;
              sql.add('select item_planning_kode from fakturpembelian_dtl where item_planning_kode=:item_planning_kode');
              parambyname('item_planning_kode').value:=Trim(sheet.cells[i,1]);
              open;
              if recordcount=0 then
                 begin


                    with q1 do
                      begin
                        sql.clear;
                        sql.add('insert into fakturpembelian_dtl');
                        sql.add('(item_planning_kode,fakturpembelian_hdr_kode,receive_qty,tolerance_qty,item_planning_utama_kode,id_company,po_hdr_po_num,st_location_kode,kurs)');
                        sql.add('values(:item_planning_kode,:fakturpembelian_hdr_kode,:receive_qty,:tolerance_qty,:item_planning_utama_kode,:id_company,:po_hdr_po_num,:st_location_kode,:kurs)');
                        parambyname('item_planning_kode').value:=Trim(sheet.cells[i,1]);
                        parambyname('fakturpembelian_hdr_kode').value:=Trim(sheet.cells[i,2]);
                        parambyname('receive_qty').value:=Trim(sheet.cells[i,3]);
                        parambyname('tolerance_qty').value:=Trim(sheet.cells[i,4]);
                        parambyname('item_planning_utama_kode').value:=Trim(sheet.cells[i,5]);
                        parambyname('id_company').value:=Trim(sheet.cells[i,6]);
                        parambyname('po_hdr_po_num').value:=Trim(sheet.cells[i,7]);
                        parambyname('st_location_kode').value:=Trim(sheet.cells[i,8]);
                        parambyname('kurs').value:=Trim(sheet.cells[i,9]);
    
                        try
                          execSQL;

                        except
                          showmessage('Error Insert');
                        end;
                      end;
                 end;
            end;
       end;


    until (Trim(sheet.cells[i+1,1])='') AND (Trim(sheet.cells[i+2,1])='');
    showmessage('Import Data Berhasil');
    end;
    end;

procedure TForm1.Button6Click(Sender: TObject);
var ExcelApp: OleVariant;
    Sheet: Variant;
    i:integer;

begin
  if MessageBox (Handle, 'Anda yakin untuk mengimport data  ?', 'Confirmation',
    MB_OKCANCEL or MB_ICONINFORMATION) = mrOK then
    begin

    ExcelApp := CreateOLEObject('Excel.Application');
    ExcelApp.Workbooks.Open[trim(edt_import.Text)];

    Sheet := ExcelApp.Workbooks[1].Worksheets[1];


    i:=4;

    repeat
    i:=i+1;
    if Trim(sheet.cells[i,1])<>'' then
       begin
          with q1 do
            begin
              sql.clear;
              sql.add('select kode from fakturpembelian_hdr where kode=:kode');
              parambyname('kode').value:=Trim(sheet.cells[i,1]);
              open;
              if recordcount=0 then
                 begin


                    with q1 do
                      begin
                        sql.clear;
                        sql.add('insert into fakturpembelian_hdr');
                        sql.add('(kode,st_agent_kode,receive_date,id_company,ven_loc_vendor)');
                        sql.add('values(:kode,:st_agent_kode,:receive_date,:id_company,:ven_loc_vendor)');
                        parambyname('kode').value:=Trim(sheet.cells[i,1]);
                        parambyname('st_agent_kode').value:=Trim(sheet.cells[i,2]);
                        parambyname('receive_date').value:=formatdatetime('YYYYYMMDD',strtodate(Trim(sheet.cells[i,3])));	
                        parambyname('id_company').value:=Trim(sheet.cells[i,4]);
                        parambyname('ven_loc_vendor').value:=Trim(sheet.cells[i,5]);
    
                        try
                          execSQL;

                        except
                          showmessage('Error Insert');
                        end;
                      end;
                 end;
            end;
       end;


    until (Trim(sheet.cells[i+1,1])='') AND (Trim(sheet.cells[i+2,1])='');
    showmessage('Import Data Berhasil');
    end;
    end;


procedure TForm1.Button7Click(Sender: TObject);
var ExcelApp: OleVariant;
    Sheet: Variant;
    i:integer;

begin
  if MessageBox (Handle, 'Anda yakin untuk mengimport data  ?', 'Confirmation',
    MB_OKCANCEL or MB_ICONINFORMATION) = mrOK then
    begin

    ExcelApp := CreateOLEObject('Excel.Application');
    ExcelApp.Workbooks.Open[trim(edt_import.Text)];

    Sheet := ExcelApp.Workbooks[1].Worksheets[1];


    i:=4;

    repeat
    i:=i+1;
    if Trim(sheet.cells[i,1])<>'' then
       begin
          with q1 do
            begin
              sql.clear;
              sql.add('select item_planning_kode from fakturpenjualan_dtl where item_planning_kode=:item_planning_kode');
              parambyname('item_planning_kode').value:=Trim(sheet.cells[i,1]);
              open;
              if recordcount=0 then
                 begin


                    with q1 do
                      begin
                        sql.clear;
                        sql.add('insert into fakturpenjualan_dtl');
                        sql.add('(item_planning_kode,faktur_hdr_kode,shipping_qty,tolerance_qty,id_company,so_hdr_so_num)');
                        sql.add('values(:item_planning_kode,:faktur_hdr_kode,:shipping_qty,:tolerance_qty,:id_company,:so_hdr_so_num)');
                        parambyname('item_planning_kode').value:=Trim(sheet.cells[i,1]);
                        parambyname('faktur_hdr_kode').value:=Trim(sheet.cells[i,2]);
                        parambyname('shipping_qty').value:=Trim(sheet.cells[i,3]);
                        parambyname('tolerance_qty').value:=Trim(sheet.cells[i,4]);
                        parambyname('id_company').value:=Trim(sheet.cells[i,5]);
                        parambyname('so_hdr_so_num').value:=Trim(sheet.cells[i,6]);

                        try
                          execSQL;

                        except
                          showmessage('Error Insert');
                        end;
                      end;
                 end;
            end;
       end;


    until (Trim(sheet.cells[i+1,1])='') AND (Trim(sheet.cells[i+2,1])='');
    showmessage('Import Data Berhasil');
    end;
    end;


procedure TForm1.Button8Click(Sender: TObject);
var ExcelApp: OleVariant;
    Sheet: Variant;
    i:integer;

begin
  if MessageBox (Handle, 'Anda yakin untuk mengimport data  ?', 'Confirmation',
    MB_OKCANCEL or MB_ICONINFORMATION) = mrOK then
    begin

    ExcelApp := CreateOLEObject('Excel.Application');
    ExcelApp.Workbooks.Open[trim(edt_import.Text)];

    Sheet := ExcelApp.Workbooks[1].Worksheets[1];


    i:=4;

    repeat
    i:=i+1;
    if Trim(sheet.cells[i,1])<>'' then
       begin
          with q1 do
            begin
              sql.clear;
              sql.add('select kode from fakturpenjualan_hdr where kode=:kode');
              parambyname('kode').value:=Trim(sheet.cells[i,1]);
              open;
              if recordcount=0 then
                 begin


                    with q1 do
                      begin
                        sql.clear;
                        sql.add('insert into fakturpenjualan_hdr');
                        sql.add('(kode,st_agent_kode,shipping_date,id_company,no_faktur,id_posting_faktur,customer,kas_debit_kredit)');
                        sql.add('values(:kode,:st_agent_kode,:shipping_date,:id_company,:no_faktur,:id_posting_faktur,:customer,:kas_debit_kredit)');
                        parambyname('kode').value:=Trim(sheet.cells[i,1]);
                        parambyname('st_agent_kode').value:=Trim(sheet.cells[i,2]);
                        parambyname('shipping_date').value:=formatdatetime('YYYYYMMDD',strtodate(Trim(sheet.cells[i,3])));
                        parambyname('id_company').value:=Trim(sheet.cells[i,4]);
                        parambyname('no_faktur').value:=Trim(sheet.cells[i,5]);
                        parambyname('id_posting_faktur').value:=Trim(sheet.cells[i,6]);
                        parambyname('customer').value:=Trim(sheet.cells[i,7]);
                        parambyname('kas_debit_kredit').value:=Trim(sheet.cells[i,8]);


                        try
                          execSQL;

                        except
                          showmessage('Error Insert');
                        end;
                      end;
                 end;
            end;
       end;


    until (Trim(sheet.cells[i+1,1])='') AND (Trim(sheet.cells[i+2,1])='');
    showmessage('Import Data Berhasil');
    end;
    end;


procedure TForm1.Button9Click(Sender: TObject);
var ExcelApp: OleVariant;
    Sheet: Variant;
    i:integer;

begin
  if MessageBox (Handle, 'Anda yakin untuk mengimport data  ?', 'Confirmation',
    MB_OKCANCEL or MB_ICONINFORMATION) = mrOK then
    begin

    ExcelApp := CreateOLEObject('Excel.Application');
    ExcelApp.Workbooks.Open[trim(edt_import.Text)];

    Sheet := ExcelApp.Workbooks[1].Worksheets[1];


    i:=4;

    repeat
    i:=i+1;
    if Trim(sheet.cells[i,1])<>'' then
       begin
          with q1 do
            begin
              sql.clear;
              sql.add('select tgl from item_hpp_hist where tgl=:tgl');
              parambyname('tgl').value:=Trim(sheet.cells[i,1]);
              open;
              if recordcount=0 then
                 begin


                    with q1 do
                      begin
                        sql.clear;
                        sql.add('insert into item_hpp_hist');
                        sql.add('(tgl,item_planning_kode,entry_date,id_company,no_urut)');
                        sql.add('values(:tgl,:item_planning_kode,:entry_date,:id_company,:no_urut)');
                        parambyname('tgl').value:=formatdatetime('YYYYYMMDD',strtodate(Trim(sheet.cells[i,1])));
                        parambyname('item_planning_kode').value:=Trim(sheet.cells[i,2]);
                        parambyname('entry_date').value:=formatdatetime('YYYYYMMDDHHMMSS',strtodate(Trim(sheet.cells[i,3])));
                        parambyname('id_company').value:=Trim(sheet.cells[i,4]);
                        parambyname('no_urut').value:=Trim(sheet.cells[i,5]);

                        try
                          execSQL;

                        except
                          showmessage('Error Insert');
                        end;
                      end;
                 end;
            end;
       end;


    until (Trim(sheet.cells[i+1,1])='') AND (Trim(sheet.cells[i+2,1])='');
    showmessage('Import Data Berhasil');
    end;
    end;

procedure TForm1.Button10Click(Sender: TObject);
var ExcelApp: OleVariant;
    Sheet: Variant;
    i:integer;

begin
  if MessageBox (Handle, 'Anda yakin untuk mengimport data  ?', 'Confirmation',
    MB_OKCANCEL or MB_ICONINFORMATION) = mrOK then
    begin

    ExcelApp := CreateOLEObject('Excel.Application');
    ExcelApp.Workbooks.Open[trim(edt_import.Text)];

    Sheet := ExcelApp.Workbooks[1].Worksheets[1];


    i:=4;

    repeat
    i:=i+1;
    if Trim(sheet.cells[i,1])<>'' then
       begin
          with q1 do
            begin
              sql.clear;
              sql.add('select idstock_card from stock_card where idstock_card=:idstock_card');
              parambyname('idstock_card').value:=Trim(sheet.cells[i,1]);
              open;
              if recordcount=0 then
                 begin


                    with q1 do
                      begin
                        sql.clear;
                        sql.add('insert into stock_card');
                        sql.add('(idstock_card,ven_lock_ vendor,item_planning_kode,hist_date,from_to,out_qty,balance_qty,reason,in_qty,id_company)');
                        sql.add('values(:idstock_card,:ven_lock_ vendor,:item_planning_kode,:hist_date,:from_to,:out_qty,:balance_qty,:reason,:in_qty,:id_company)');
                        parambyname('idstock_card').value:=Trim(sheet.cells[i,1]);
                        parambyname('ven_lock_ vendor').value:=Trim(sheet.cells[i,2]);
                        parambyname('item_planning_kode').value:=Trim(sheet.cells[i,3]);
                        parambyname('hist_date').value:=formatdatetime('YYYYYMMDD',strtodate(Trim(sheet.cells[i,4])));
                        parambyname('from_to').value:=Trim(sheet.cells[i,5]);
                        parambyname('out_qty').value:=Trim(sheet.cells[i,6]);
                        parambyname('balance_qty').value:=Trim(sheet.cells[i,7]);
                        parambyname('reason').value:=Trim(sheet.cells[i,8]);
                        parambyname('in_qty').value:=Trim(sheet.cells[i,9]);
                        parambyname('id_company').value:=Trim(sheet.cells[i,10]);

                        try
                          execSQL;

                        except
                          showmessage('Error Insert');
                        end;
                      end;
                 end;
            end;
       end;


    until (Trim(sheet.cells[i+1,1])='') AND (Trim(sheet.cells[i+2,1])='');
    showmessage('Import Data Berhasil');
    end;
    end;
end.
