// D2_TrafficQueryDlg.h : ͷ�ļ�
//

#pragma once


// CD2_TrafficQueryDlg �Ի���
class CD2_TrafficQueryDlg : public CDialog
{
// ����
public:
	CD2_TrafficQueryDlg(CWnd* pParent = NULL);	// ��׼���캯��

// �Ի�������
	enum { IDD = IDD_D2_TRAFFICQUERY_DIALOG };

	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV ֧��


// ʵ��
protected:
	HICON m_hIcon;

	// ���ɵ���Ϣӳ�亯��
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	DECLARE_MESSAGE_MAP()
public:
    afx_msg void OnBnClickedButtonConfirm();
};
