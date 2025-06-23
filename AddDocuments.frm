VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} AddDocuments 
   Caption         =   "UserForm1"
   ClientHeight    =   7740
   ClientLeft      =   405
   ClientTop       =   1050
   ClientWidth     =   22365
   OleObjectBlob   =   "AddDocuments.frx":0000
   StartUpPosition =   1  'CenterOwner
End
Attribute VB_Name = "AddDocuments"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Add1_Click()
    Dim i As Long
    With Me.ListBox1
        ' Loop backwards so removing items doesn’t skip any
        For i = .ListCount - 1 To 0 Step -1
            If .Selected(i) Then
                ' Copy to ListBox2
                Me.ListBox2.AddItem .List(i)
                ' Remove from ListBox1
                .RemoveItem i
            End If
        Next i
    End With
End Sub

Private Sub Add2_Click()

If ListBox1.Enabled Then
    Dim i As Long
    With Me.ListBox1
        ' Loop backwards to safely remove items
        For i = .ListCount - 1 To 0 Step -1
            ' Copy each item to ListBox2
            Me.ListBox2.AddItem .List(i)
            ' Remove it from ListBox1
            .RemoveItem i
        Next i
    End With
End If

End Sub

Private Sub CheckBox1_Change()
    If CheckBox1.Value = True Then
        CheckBox5.Value = True
        CheckBox6.Value = True
        CheckBox7.Value = True
        CheckBox8.Value = True
        CheckBox9.Value = True
        CheckBox10.Value = True
    Else
        CheckBox5.Value = False
        CheckBox6.Value = False
        CheckBox7.Value = False
        CheckBox8.Value = False
        CheckBox9.Value = False
        CheckBox10.Value = False
    End If
End Sub

Private Sub CheckBox19_Click()

End Sub

Private Sub CheckBox2_Change()
    ListBox1.Enabled = CheckBox2
    ListBox2.Enabled = CheckBox2
End Sub

Private Sub CheckBox2_Click()

End Sub

Private Sub CheckBox21_Click()

End Sub

Private Sub CheckBox3_Change()
    CheckBox11.Enabled = CheckBox3
    CheckBox12.Enabled = CheckBox3
    CheckBox13.Enabled = CheckBox3
    CheckBox14.Enabled = CheckBox3
    
    CheckBox11.Value = CheckBox3
    CheckBox12.Value = CheckBox3
    CheckBox13.Value = CheckBox3
    CheckBox14.Value = CheckBox3
End Sub

Private Sub CheckBox4_Change()
    If Not CheckBox4 Then
        CheckBox15.Value = CheckBox4
        CheckBox16.Value = CheckBox4
        CheckBox17.Value = CheckBox4
        CheckBox18.Value = CheckBox4
        CheckBox19.Value = CheckBox4
        CheckBox20.Value = CheckBox4
        CheckBox21.Value = CheckBox4
    End If
    
    CheckBox15.Enabled = CheckBox4
    CheckBox16.Enabled = CheckBox4
    CheckBox17.Enabled = CheckBox4
    CheckBox18.Enabled = CheckBox4
    CheckBox19.Enabled = CheckBox4
    CheckBox20.Enabled = CheckBox4
    CheckBox21.Enabled = CheckBox4
End Sub

Private Sub CommandButton2_Click()
    
End Sub

Private Sub Remove1_Click()
    Dim i As Long
    With Me.ListBox2
        ' Loop backwards so removing items doesn’t skip any
        For i = .ListCount - 1 To 0 Step -1
            If .Selected(i) Then
                ' Copy to ListBox2
                Me.ListBox1.AddItem .List(i)
                ' Remove from ListBox1
                .RemoveItem i
            End If
        Next i
    End With
End Sub

Private Sub Remove2_Click()
If ListBox1.Enabled Then
    Dim i As Long
    With Me.ListBox2
        ' Loop backwards to safely remove items
        For i = .ListCount - 1 To 0 Step -1
            ' Copy each item to ListBox2
            Me.ListBox1.AddItem .List(i)
            ' Remove it from ListBox1
            .RemoveItem i
        Next i
    End With
End If
End Sub

Private Sub UserForm_Initialize()
    ListBox1.AddItem "VENDOR DOCUMENT LIST (VDL)"
    ListBox1.AddItem "DATASHEET"
    ListBox1.AddItem "ELECTRICAL CONSUMERS LIST"
    ListBox1.AddItem "HEAT LOAD CALCULATIONS"
    ListBox1.AddItem "PANEL SIZING CALCULATION"
    ListBox1.AddItem "OPERATIONAL FLOW CHART"
    ListBox1.AddItem "SINGLE LINE DIAGRAM OF INTEGRATED EQUIPMENT"
    ListBox1.AddItem "GENERAL ARRANGEMENT DRAWING - 3D"
    ListBox1.AddItem "WEIGHT / CENTER OF GRAVITY DRAWING"
    ListBox1.AddItem "FUNCTIONAL DESIGN SPECIFICATION"
    ListBox1.AddItem "INTERCONNECTION DIAGRAM / HARDWIRE I/O LIST"
    ListBox1.AddItem "EARTHING SYSTEM CONNECTION"
    ListBox1.AddItem "INPUT SWITCHGEAR REQUIREMENTS FOR VSD OPERATION"
    ListBox1.AddItem "PACKING PROCEDURE"
    ListBox1.AddItem "EFFICIENCY CALCULATIONS"
    ListBox1.AddItem "STORAGE & PRESERVATION PROCEDURE"
    ListBox1.AddItem "TRANSPORTATION AND LIFTING INSTRUCTIONS"
    ListBox1.AddItem "SISMIC ANALYSIS"
    ListBox1.AddItem "NOISE DATASHEET"
    ListBox1.AddItem "PRODUCT INSTALLATION AND OPERATION MANUAL - SPECIAL"
    ListBox1.AddItem "CAUSE & EFFECT DIAGRAM"
    ListBox1.AddItem "SYSTEM OPERATION MANUAL "
    ListBox1.AddItem "HMI OPERATION MANUAL"
    ListBox1.AddItem "COMMUNICATION TABLE"
    ListBox1.AddItem "HMI SCREENS"
    ListBox1.AddItem "QUALITY MANAGEMENT SYSTEM MANUAL - WAU"
    ListBox1.AddItem "MATERIAL CERTIFICATE"
    ListBox1.AddItem "MATERIAL CONFORMITY CERTIFICATE"
    ListBox1.AddItem "DATABOOK INDEX"
    ListBox1.AddItem "DATABOOK - STANDARD: ELECTRONIC version (electronic copy)"
    ListBox1.AddItem "DATABOOK - STANDARD: PRINTED version (hard copy)"
    ListBox1.AddItem "DATABOOK - SPECIAL: ELECTRONIC version (electronic copy)"
    ListBox1.AddItem "DATABOOK - SPECIAL: PRINTED version (hard copy)"
    ListBox1.AddItem "CERTIFICATE OF ORIGIN"
    ListBox1.AddItem "FUMIGATION CERTIFICATE"
    ListBox1.AddItem "LOCAL CONTENT CERTIFICATE"

    ComboBox1.AddItem "MVW3000"
    ComboBox1.AddItem "SSW7000"
    ComboBox1.AddItem "MVW01"
    ComboBox1.AddItem "AFW11"
    ComboBox1.AddItem "AFW11C"
    ComboBox1.AddItem "AFW900"
    ComboBox1.AddItem "AFW11 AFE"
    ComboBox1.AddItem "AFW900C"
    ComboBox1.AddItem "ASW900"
    ComboBox1.AddItem "UPS"
    ComboBox1.AddItem "RTDW"
    ComboBox1.AddItem "QMBP"

End Sub
