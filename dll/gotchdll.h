
#ifndef _THTH_GOTCHDLL_H_
#define _THTH_GOTCHDLL_H_

extern void EXPENTRY InitDLL (HAB hab, HWND hwnd);
extern void EXPENTRY StartInputHook (void);
extern void EXPENTRY StopInputHook (void);
extern USHORT Version (VOID);

#endif
