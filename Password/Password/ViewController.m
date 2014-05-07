//
//  ViewController.m
//  Password
//
//  Created by panda zheng on 14-5-5.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import "ViewController.h"

#define RANDOM_SEED() srandom(time(NULL))
#define RANDOM_INT(__MIN__, __MAX__) ((__MIN__) + random() % ((__MAX__+1) - (__MIN__)))

@interface ViewController ()

@end

@implementation ViewController

@synthesize passwordLength,phoneticPassword,emailPasswordButton,createPassword,password;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIImage *buttonBackground = [UIImage imageNamed:@"blueButton.png"];
    [createPassword setBackgroundImage:buttonBackground forState:UIControlStateNormal];
    [emailPasswordButton setBackgroundImage:buttonBackground forState:UIControlStateNormal];
    
    [createPassword setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [emailPasswordButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    UIImage *buttonBackgroundSel = [UIImage imageNamed:@"whiteButton.png"];
    [createPassword setBackgroundImage:buttonBackgroundSel forState:UIControlStateHighlighted];
    [createPassword setBackgroundImage:buttonBackgroundSel forState:UIControlStateSelected];
    [emailPasswordButton setBackgroundImage:buttonBackgroundSel forState:UIControlStateHighlighted];
    [emailPasswordButton setBackgroundImage:buttonBackgroundSel forState:UIControlStateSelected];
    
    [createPassword setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [createPassword setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    [emailPasswordButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [emailPasswordButton setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    
    //初始化数据库文件
    //根据路径创建数据库并创建一个表password(id password)
    NSString *docsDir;
    NSArray  *dirPaths;
    
    //得到当前目录
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    docsDir = [dirPaths objectAtIndex:0];
    
    // Build the path to the database file
    databasePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent: @"contacts.db"]];
    
    NSFileManager *filemgr = [NSFileManager defaultManager];
    
    if ([filemgr fileExistsAtPath:databasePath] == NO)
    {
        const char *dbpath = [databasePath UTF8String];
        if (sqlite3_open(dbpath, &contactDB) == SQLITE_OK)
        {
            char *errMsg;
            const char *sql_stmt = "CREATE TABLE IF NOT EXISTS PASSWORDS(ID INTEGER PRIMARY KEY AUTOINCREMENT,PASSWORD TEXT)";
            if (sqlite3_exec(contactDB, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK)
            {
                NSLog(@"创建表失败!");
            }
        }
        else
        {
            NSLog(@"创建/打开数据库失败");
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) textFieldDoneEditing:(id)sender
{
    [sender resignFirstResponder];
}

- (IBAction) setPassword
{
    NSLog(@"set password!");
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    
    [password setAlpha:0.0];
    [phoneticPassword setAlpha:0.0];
    [emailPasswordButton setAlpha:0.0];
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    [password setAlpha:0.85];
    [emailPasswordButton setAlpha:0.85];
    if (showPhonetics.on)
    {
        [phoneticPassword setAlpha:0.85];
    }
    [UIView commitAnimations];
    
	NSArray *keys = [NSArray arrayWithObjects:
                     @"a", @"b", @"c", @"d", @"e",
                     @"f", @"g", @"h", @"i", @"j",
                     @"k", @"l", @"m", @"n", @"o",
                     @"p", @"q", @"r", @"s",	@"t",
                     @"u", @"v", @"w", @"x",	@"y", @"z",
                     
                     @"A", @"B", @"C", @"D", @"E",
                     @"F", @"G", @"H", @"I", @"J",
                     @"K", @"L", @"M", @"N", @"O",
                     @"P", @"Q", @"R", @"S", @"T",
                     @"U", @"V", @"W", @"X", @"Y", @"Z",
                     
                     @"0", @"1", @"2", @"3", @"4",
                     @"5", @"6", @"7", @"8", @"9",
                     
                     @"~", @"!", @"?", @"#", @"%",
                     @"^", @"&", @"*", @"(", @")",
                     
					 nil];
	
	NSArray *objects = [NSArray arrayWithObjects:
                        @"alpha", @"bravo", @"charlie", @"delta", @"echo",
                        @"foxtrot", @"golf", @"hotel", @"india", @"juliet",
                        @"kilo", @"lima", @"mike", @"november", @"oscar",
                        @"papa", @"quebec", @"romeo", @"sierra", @"tango",
                        @"uniform", @"victor", @"whiskey", @"xray", @"yankee", @"zulu",
						
                        @"ALPHA", @"BRAVO", @"CHARLIE", @"DELTA", @"ECHO",
                        @"FOXTROT", @"GOLF", @"HOTEL", @"INDIA", @"JULIET",
                        @"KILO", @"LIMA", @"MIKE", @"NOVEMBER", @"OSCAR",
                        @"PAPA", @"QUEBEC", @"ROMEO", @"SIERRA", @"TANGO",
                        @"UNIFORM", @"VICTOR", @"WHISKEY", @"XRAY", @"YANKEE", @"ZULU",
						
                        @"Zero", @"One", @"Two", @"Three", @"Four", 
                        @"Five", @"Six", @"Seven", @"Eight", @"Nine",
						
                        @"Tilda", @"Exclamation Point", @"Question Mark", @"Pound Sign", @"Percent Sign", 
                        @"Carrot Sign", @"Ampersand", @"Asterick", @"Left Parenthesis", @"Right Parenthesis",
						
                        nil];
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
    
    NSInteger iPasswordLength = [passwordLength.text intValue];
    BOOL bShowPhonetics = showPhonetics.on;
    BOOL bIncludeLowerCase = includeLowerCase.on;
    BOOL bIncludeUpperCase = includeUpperCase.on;
    BOOL bIncludeNumbers = includeNumbers.on;
    BOOL bIncludePunctuation = includePunctuation.on;
    
    NSString* passwordText = @"";
	NSString* phoneticText = @"";
    
	NSString* lowercaseChars = @"abcdefghijklmnopqrstuvwxyz";
	NSString* uppercaseChars = @"ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	NSString* numbersChars = @"0123456789";
	NSString* punctuationChars = @"~!?#%^&*()";
    
    RANDOM_SEED();
    
    if (!bIncludeLowerCase && !bIncludeUpperCase && !bIncludeNumbers && !bIncludePunctuation)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"PasswordGen" message:@"No password character set selected" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    
	NSString* passwordChars = @"";
	
	if(bIncludeLowerCase)
		passwordChars = [NSString stringWithFormat:@"%@%@", passwordChars, lowercaseChars];
	
	if(bIncludeUpperCase)
		passwordChars = [NSString stringWithFormat:@"%@%@", passwordChars, uppercaseChars];
	
	if(bIncludeNumbers)
		passwordChars = [NSString stringWithFormat:@"%@%@", passwordChars, numbersChars];
	
	if(bIncludePunctuation)
		passwordChars = [NSString stringWithFormat:@"%@%@", passwordChars, punctuationChars];

    
    for (NSInteger i = 0 ; i < iPasswordLength ; i++)
    {
        int index = RANDOM_INT(0, [passwordChars length] - 1);
        
        NSRange range = NSMakeRange(index, 1);
        NSString *passwordChar = [passwordChars substringWithRange:range];
        
        passwordText = [NSString stringWithFormat:@"%@%@",passwordText,passwordChar];
        
        NSLog(@"%@",passwordChar);
        
        if (i > 0)
        {
            phoneticText = [NSString stringWithFormat:@"%@ , %@",phoneticText,[dictionary valueForKey:passwordChar]];
        }
        else
        {
            phoneticText = [dictionary valueForKey:passwordChar];
            
        }
    }
    
    password.text = @"";
    password.text = passwordText;
    phoneticPassword.text = @"";
    
    if (bShowPhonetics)
    {
        phoneticPassword.text = phoneticText;
    }
}

- (IBAction) emailPassword
{
/*    NSLog(@"email password!");
    NSString *urlString = @"mailto:?subject=Password%20Generator&body=";
    urlString = [urlString stringByAppendingString:@"Password: %20"];
    urlString = [urlString stringByAppendingString:password.text];
    
    if (showPhonetics.on)
    {
        urlString = [urlString stringByAppendingString:@"%20Phonetic: %20"];
        urlString = [urlString stringByAppendingString:[phoneticPassword.text stringByReplacingOccurrencesOfString:@" " withString:@"%20"]];
    }
    
    NSURL *mailUrl = [NSURL URLWithString:urlString];
    [[UIApplication sharedApplication] openURL:mailUrl];*/
    NSLog(@"Save password to Data");
    sqlite3_stmt *statement;
    
    const char *dbpath = [databasePath UTF8String];
    
    if (sqlite3_open(dbpath, &contactDB) == SQLITE_OK)
    {
        NSString *insertSQL = [NSString stringWithFormat:@"INSERT INTO PASSWORDS(password) VALUES(\"%@\")",password.text];
        const char *insert_stmt = [insertSQL UTF8String];
        sqlite3_prepare_v2(contactDB, insert_stmt, -1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE)
        {
            NSLog(@"已存储到数据库");
            password.text = @"";
        }
        else
        {
            NSLog(@"保存失败!");
        }
        
        sqlite3_finalize(statement);
        sqlite3_close(contactDB);
    }
}

@end
