//
//  NHXIBDynamicVCR.m
//  NHDynamicCellPro
//
//  Created by hu jiaju on 15/11/18.
//  Copyright © 2015年 hu jiaju. All rights reserved.
//

#import "NHXIBDynamicVCR.h"
#import "NHPropertyCell.h"

static const NSString *constString = @"相声（Crosstalk），一种民间说唱曲艺。相声一词，古作象生，原指模拟别人的言行，后发展为象声。象声又称隔壁象声。相声起源于华北地区的民间说唱曲艺，在明朝即已盛行。经清朝时期的发展直至民国初年，相声逐渐从一个人摹拟口技发展成为单口笑话，名称也就随之转变为相声。一种类型的单口相声，后来逐步发展为多种类型：单口相声、对口相声、群口相声，综合为一体。相声在两岸三地有不同的发展模式。中国相声有三大发源地：北京天桥、天津劝业场、三不管儿和南京夫子庙。相声艺术源于华北，流行于京津冀，普及于全国及海内外，始于明清，盛于当代。主要采用口头方式表演。表演形式有单口相声、对口相声、群口相声等，是扎根于民间、源于生活、又深受群众欢迎的曲艺表演艺术形式。相声鼻祖为张三禄，著名流派有“马（三立）派”、“侯（宝林）派”、“常（宝堃）派”、“苏（文茂）派”、“马（季）派”等。著名相声表演大师有马三立、侯宝林、常宝堃、苏文茂、刘宝瑞等多人。二十世纪晚期，以侯宝林、马三立为首的一代相声大师相继陨落，相声事业陷入低谷。2005年起，凭借在网络视频网站等新兴媒体的传播，相声演员郭德纲及其德云社异军突起，使公众重新关注相声这一艺术门类，实现了相声的二次复兴。";

@interface NHXIBDynamicVCR ()<UITableViewDelegate, UITableViewDataSource>

@property (nullable, nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong, nullable) UITableView *tableView;
@property (nullable, nonatomic, strong) NHPropertyCell *propertyCell;

@end

@implementation NHXIBDynamicVCR

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"label cell";
    
    _dataSource = [NSMutableArray arrayWithArray:[self generateDataSource]];
    
    CGSize mainSize = [[UIScreen mainScreen] bounds].size;
    CGRect infoRect = CGRectMake(0, 0, mainSize.width, mainSize.height);
    _tableView = [[UITableView alloc] initWithFrame:infoRect style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    UINib *nib = [UINib nibWithNibName:@"NHPropertyCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"labelCell"];
    
    // 初始化 prototypeCell 以便复用
    _propertyCell = [_tableView dequeueReusableCellWithIdentifier:@"labelCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray *)generateDataSource {
    NSMutableArray *tmp = [NSMutableArray array];
    
    int minLen = 7;
    int maxLen = (int)[constString length];
    int counts = 19;
    for (int i = 0; i < counts; i++) {
        int ret = [self generateFrom:minLen to:maxLen];
        NSString *tmp_str = [constString substringToIndex:ret];
        [tmp addObject:tmp_str];
    }
    
    return [tmp copy];
}

#pragma mark == UITableView Delegate && DataSource ==

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _dataSource.count;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 44.f;
//}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NHPropertyCell *cell = _propertyCell;
    
    NSString *info = [_dataSource objectAtIndex:[indexPath row]];
    cell.label.text = info;
    cell.subLabel.text = info;
    CGSize size = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    CGFloat height = size.height + 1;
    NSLog(@"heigt row : %f",height);
    return height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"labelCell";
    //    NHPropertyCell *cell = (NHPropertyCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    NHPropertyCell *cell = (NHPropertyCell *)[tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    if (cell == nil) {
        //        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell = [[[NSBundle mainBundle] loadNibNamed:@"NHPropertyCell" owner:self options:nil] lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    NSString *info = [_dataSource objectAtIndex:[indexPath row]];
    //    NSLog(@"info :%@",info);
    cell.label.text = info;
    cell.subLabel.text = info;
    
    return cell;
}

- (int)generateFrom:(int)from to:(int)to {
    int randomNumber = (arc4random()%(to-from))+from;
    NSLog(@"random :%d",randomNumber);
    return randomNumber;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
