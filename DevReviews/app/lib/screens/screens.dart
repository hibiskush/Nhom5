import 'package:flutter/services.dart';
import 'package:wallet/providers/ethereum_provider.dart';
import 'package:flutter/material.dart';
import 'package:wallet/utils/format.dart';
import 'package:wallet/widgets/token_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final ethereumProvider = Provider.of<EthereumProvider>(context, listen: false);
      ethereumProvider.fetchBalance();
      ethereumProvider.fetchPriceChange();
      ethereumProvider.startAutoUpdateBalance();
    });
  }

  @override
  void dispose() {
    final ethereumProvider = Provider.of<EthereumProvider>(context, listen: false);
    ethereumProvider.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ethereumProvider = Provider.of<EthereumProvider>(context);
    
    return Column(
      children: [
        Container(
          color: Colors.white,
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              ethereumProvider.isLoading
                  ? CircularProgressIndicator()
                  : ethereumProvider.walletModel?.getBalance != null
                      ? Text(
                          '\$${ethereumProvider.walletModel?.getBalance.toStringAsFixed(2)}',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        )
                      : Text('NaN'),
              SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ethereumProvider.balanceChange?.toStringAsFixed(2) ?? "NaN",
                    style: TextStyle(
                      fontSize: 16,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    '(${ethereumProvider.priceChange?.toStringAsFixed(2) ?? "NaN"}%)',
                    style: TextStyle(
                      fontSize: 16,
                      color: ethereumProvider.priceChange! > 0
                          ? const Color.fromARGB(255, 0, 200, 0)
                          : const Color.fromARGB(255, 200, 0, 0),
                      backgroundColor: const Color.fromARGB(255, 215, 215, 215),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Nút Nhận
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ReceiveScreen()),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.orange[100],
                            shape: BoxShape.circle,
                          ),
                          padding:
                              EdgeInsets.all(12), // Kích thước padding cân bằng
                          child: Icon(
                            Icons.arrow_downward,
                            color: Colors.orange,
                            size: 24, // Kích thước icon nhỏ hơn
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Nhận',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),

                  // Nút Gửi
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SendScreen()),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.orange[100],
                            shape: BoxShape.circle,
                          ),
                          padding: EdgeInsets.all(12),
                          child: Icon(
                            Icons.arrow_upward,
                            color: Colors.orange,
                            size: 24,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Gửi',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),

                  // Nút Đổi
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SwapScreen()),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.orange[100],
                            shape: BoxShape.circle,
                          ),
                          padding: EdgeInsets.all(12),
                          child: Icon(
                            Icons.swap_horiz,
                            color: Colors.orange,
                            size: 24,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Đổi',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),

                  // Nút Mua
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BuyAndSellScreen()),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.orange[100],
                            shape: BoxShape.circle,
                          ),
                          padding: EdgeInsets.all(12),
                          child: Icon(
                            Icons.shopping_cart,
                            color: Colors.orange,
                            size: 24,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Mua',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 12),
        Expanded(
          child: Container(
            color: Colors.white,
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                TokenCard(tokenName: 'Ethereum', balance: "${ethereumProvider.walletModel?.getEtherAmount}", price: "${ethereumProvider.walletModel?.getBalance.toStringAsFixed(2)}"),
                // TokenCard(tokenName: 'Solana', balance: '5.4', price: '23.00'),
                // TokenCard(tokenName: 'USDT', balance: '127.5', price: '1.00'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CollectionScreen extends StatelessWidget {
  final List<Map<String, String>> nfts = [
    {
      "image": "https://via.placeholder.com/150",
      "title": "NFT #1",
      "description": "Bộ sưu tập Crypto Art"
    },
    {
      "image": "https://via.placeholder.com/150",
      "title": "NFT #2",
      "description": "Tác phẩm độc quyền"
    },
    {
      "image": "https://via.placeholder.com/150",
      "title": "NFT #3",
      "description": "Bộ sưu tập đặc biệt"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Bộ sưu tập NFT"),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: nfts.length,
          itemBuilder: (context, index) {
            final nft = nfts[index];
            return GestureDetector(
              onTap: () {
                // Thêm xử lý khi nhấn vào NFT
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(12),
                        ),
                        child: Image.network(
                          nft["image"]!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            nft["title"]!,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            nft["description"]!,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class SendScreen extends StatefulWidget {
  @override
  SendScreenState createState() => SendScreenState();
}

class SendScreenState extends State<SendScreen> {
  final List<String> tokens = ["Solana", "Ethereum", "USDT"];
  String selectedToken = "Ethereum";
  TextEditingController amountController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  double transactionFee = 0.0;

  bool isValidInput() {
    if (amountController.text.isEmpty || addressController.text.isEmpty) {
      return false;
    }

    if (double.tryParse(amountController.text) == null) {
      return false;
    }

    return true;
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final ethereumProvider = Provider.of<EthereumProvider>(context, listen: false);
      ethereumProvider.fetchBalance();
      ethereumProvider.fetchPriceChange();
      ethereumProvider.startAutoUpdateBalance();
    });
  }

  @override
  void dispose() {
    final ethereumProvider = Provider.of<EthereumProvider>(context, listen: false);
    ethereumProvider.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ethereumProvider = Provider.of<EthereumProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Gửi tiền mã hóa"),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Số dư: ${ethereumProvider.walletModel?.getEtherAmount} ETH", 
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
            ),
            Text(
              "Chọn loại tiền",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButton<String>(
                isExpanded: true,
                value: selectedToken,
                icon: Icon(Icons.arrow_drop_down, color: Colors.orange),
                underline: SizedBox(),
                items: tokens.map((String token) {
                  return DropdownMenuItem<String>(
                    value: token,
                    child: Text(token),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedToken = newValue!;
                  });
                },
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Địa chỉ ví nhận",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: addressController,
                    decoration: InputDecoration(
                      hintText: "Nhập địa chỉ ví hoặc quét mã QR",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onChanged: (_) {
                      if (isValidInput()) {
                        ethereumProvider.fetchGasFee(addressController.text, double.parse(amountController.text));
                        transactionFee = ethereumProvider.gasFee;
                      } else {
                        setState(() {
                          transactionFee = 0.0;
                        });
                      }
                    },
                  ),
                ),
                SizedBox(width: 8),
                IconButton(
                  icon: Icon(Icons.qr_code_scanner, color: Colors.orange),
                  onPressed: () {
                  },
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              "Số lượng gửi",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Nhập số lượng tiền mã hóa",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onChanged: (_) {
                if (isValidInput()) {
                  ethereumProvider.fetchGasFee(addressController.text, double.parse(amountController.text));
                  transactionFee = ethereumProvider.gasFee;
                } else {
                  setState(() {
                    transactionFee = 0.0;
                  });
                }
              },
            ),
            SizedBox(height: 16),
            Text(
              "Chi phí giao dịch: $transactionFee ETH",
              style: TextStyle(color: Colors.grey),
            ),
            Divider(),
            SizedBox(height: 16),
            Text(
              "Chi tiết giao dịch",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Loại tiền: $selectedToken",
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Ví nhận: ${addressController.text.isEmpty ? 'Chưa nhập' : AddressFormat.formatAddress(addressController.text)}",
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Số lượng: ${amountController.text.isEmpty ? 'Chưa nhập' : amountController.text} $selectedToken",
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Chi phí giao dịch: $transactionFee ETH",
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                if (isValidInput()) {
                  ethereumProvider.sendTransaction(addressController.text, double.parse(amountController.text));
                  amountController.clear();
                  addressController.clear();
                  setState(() {
                    transactionFee = 0.0;
                  });

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Giao dịch thành công"),
                      backgroundColor: Colors.green,
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Center(
                child: Text(
                  "Gửi ngay",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HistoryScreen extends StatefulWidget {
  @override
  State<HistoryScreen> createState() => HistoryScreenState();
}

class HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final ethereumProvider = Provider.of<EthereumProvider>(context, listen: false);
      ethereumProvider.startAutoUpdateBalance();
      ethereumProvider.loadTransactions();
    });
  }

  @override
  void dispose() {
    final ethereumProvider = Provider.of<EthereumProvider>(context, listen: false);
    ethereumProvider.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ethereumProvider = Provider.of<EthereumProvider>(context);
    final List<Map<String, dynamic>> transactions = [];
    for (var transaction in ethereumProvider.transactions) {
      transactions.add({
        "type": transaction.from!.getAddress == ethereumProvider.walletModel!.getAddress
            ? "Gửi"
            : "Nhận",
        "amount": transaction.amount,
        "address": AddressFormat.formatAddress(transaction.to!.getAddress!),
        "date": transaction.date,
        "status": "Thành công",
      });
    }

    transactions.sort((a, b) => b["date"].compareTo(a["date"]));

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Lịch sử giao dịch"),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemCount: transactions.length,
          separatorBuilder: (context, index) => Divider(),
          itemBuilder: (context, index) {
            final transaction = transactions[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: transaction["type"] == "Gửi"
                    ? Colors.orange[100]
                    : transaction["type"] == "Nhận"
                        ? Colors.green[100]
                        : Colors.blue[100],
                child: Icon(
                  transaction["type"] == "Gửi"
                      ? Icons.arrow_upward
                      : transaction["type"] == "Nhận"
                          ? Icons.arrow_downward
                          : Icons.swap_horiz,
                  color: transaction["type"] == "Gửi"
                      ? Colors.orange
                      : transaction["type"] == "Nhận"
                          ? Colors.green
                          : Colors.blue,
                ),
              ),
              title: Text(
                "${transaction["type"]} ${transaction["amount"]} ETH",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "Địa chỉ: ${transaction["address"]}\nNgày: ${transaction["date"]}",
                style: TextStyle(color: Colors.grey),
              ),
              trailing: Text(
                transaction["status"],
                style: TextStyle(
                  color: transaction["status"] == "Thành công"
                      ? Colors.green
                      : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                // Thêm xử lý khi nhấn vào giao dịch
              },
            );
          },
        ),
      ),
    );
  }
}

class LastScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mạng lưới Ví Phantom"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Tìm kiếm token
              _buildSectionHeader("Tìm kiếm Token"),
              _buildTokenSearch(),

              // Top trending tokens
              _buildSectionHeader("Top Trending Tokens"),
              _buildTrendingTokens(),

              // Top trending sites
              _buildSectionHeader("Top Trending Sites"),
              _buildTrendingSites(),

              // Top trending collections
              _buildSectionHeader("Top Trending Collections"),
              _buildTrendingCollections(),

              // Learn
              _buildSectionHeader("Learn"),
              _buildLearn(),

              // Quest
              _buildSectionHeader("Quest"),
              _buildQuest(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildTokenSearch() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Tìm kiếm token...',
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  Widget _buildTrendingTokens() {
    return Container(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5, // Số lượng token hiển thị
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.blueAccent,
                  child:
                      Icon(Icons.currency_pound_outlined, color: Colors.white),
                ),
                SizedBox(height: 8),
                Text('Token ${index + 1}',
                    style: TextStyle(fontWeight: FontWeight.w500)),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildTrendingSites() {
    return Container(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5, // Số lượng site hiển thị
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.greenAccent,
                  child: Icon(Icons.web, color: Colors.white),
                ),
                SizedBox(height: 8),
                Text('Site ${index + 1}',
                    style: TextStyle(fontWeight: FontWeight.w500)),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildTrendingCollections() {
    return Container(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5, // Số lượng collections hiển thị
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.purpleAccent,
                  child: Icon(Icons.collections, color: Colors.white),
                ),
                SizedBox(height: 8),
                Text('Collection ${index + 1}',
                    style: TextStyle(fontWeight: FontWeight.w500)),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildLearn() {
    return Container(
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildLearnItem("Học về Token", Icons.book),
          _buildLearnItem("Học về Blockchain", Icons.library_books),
          _buildLearnItem("Học về Crypto", Icons.account_balance),
        ],
      ),
    );
  }

  Widget _buildLearnItem(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.orangeAccent,
            child: Icon(icon, color: Colors.white),
          ),
          SizedBox(height: 8),
          Text(title, style: TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _buildQuest() {
    return Container(
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildQuestItem("Thử thách 1", Icons.flag),
          _buildQuestItem("Thử thách 2", Icons.flag),
          _buildQuestItem("Thử thách 3", Icons.flag),
        ],
      ),
    );
  }

  Widget _buildQuestItem(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.blue,
            child: Icon(icon, color: Colors.white),
          ),
          SizedBox(height: 8),
          Text(title, style: TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}

class ReceiveScreen extends StatefulWidget {
  @override
  State<ReceiveScreen> createState() => _ReceiveScreenState();
}

class _ReceiveScreenState extends State<ReceiveScreen> {
  @override
  Widget build(BuildContext context) {
    final ethereumProvider = Provider.of<EthereumProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Nhận tiền mã hóa"),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 16),
              Text(
                "Quét mã QR để nhận tiền",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Container(
                height: 200,
                width: 200,
                color: Colors.grey[200],
                child: Center(
                  child: Icon(Icons.qr_code, size: 100, color: Colors.grey),
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Địa chỉ ví của bạn:",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              SelectableText(
                AddressFormat.formatAddress(ethereumProvider.walletModel!.getAddress!),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  // Sao chép nội dung của SelectableText vào Clipboard
                  Clipboard.setData(ClipboardData(text: ethereumProvider.walletModel!.getAddress!));
                  // Hiển thị thông báo đã sao chép thành công
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Địa chỉ đã được sao chép!')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40), // Tăng kích thước nút
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Bo góc mềm mại hơn
                  ),
                  elevation: 5, // Hiệu ứng đổ bóng
                ),
                child: Text(
                  "Sao chép địa chỉ",
                  style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SwapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Swap tiền mã hóa"),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Từ loại tiền",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            DropdownButtonFormField(
              items: [
                DropdownMenuItem(child: Text("ETH"), value: "ETH"),
                DropdownMenuItem(child: Text("USDT"), value: "USDT"),
                DropdownMenuItem(child: Text("BTC"), value: "BTC"),
              ],
              onChanged: (value) {
                // Xử lý chọn loại tiền
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                hintText: "Chọn loại tiền",
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Sang loại tiền",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            DropdownButtonFormField(
              items: [
                DropdownMenuItem(child: Text("ETH"), value: "ETH"),
                DropdownMenuItem(child: Text("USDT"), value: "USDT"),
                DropdownMenuItem(child: Text("BTC"), value: "BTC"),
              ],
              onChanged: (value) {
                // Xử lý chọn loại tiền
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                hintText: "Chọn loại tiền",
              ),
            ),
            SizedBox(height: 16),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Nhập số lượng cần swap",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Xử lý swap
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Center(
                child: Text(
                  "Swap ngay",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Sw extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Swap tiền mã hóa"),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Từ loại tiền",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            DropdownButtonFormField(
              items: [
                DropdownMenuItem(child: Text("ETH"), value: "ETH"),
                DropdownMenuItem(child: Text("USDT"), value: "USDT"),
                DropdownMenuItem(child: Text("BTC"), value: "BTC"),
              ],
              onChanged: (value) {
                // Xử lý chọn loại tiền
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                hintText: "Chọn loại tiền",
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Sang loại tiền",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            DropdownButtonFormField(
              items: [
                DropdownMenuItem(child: Text("ETH"), value: "ETH"),
                DropdownMenuItem(child: Text("USDT"), value: "USDT"),
                DropdownMenuItem(child: Text("BTC"), value: "BTC"),
              ],
              onChanged: (value) {
                // Xử lý chọn loại tiền
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                hintText: "Chọn loại tiền",
              ),
            ),
            SizedBox(height: 16),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Nhập số lượng cần swap",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Xử lý swap
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Center(
                child: Text(
                  "Swap ngay",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BuyAndSellScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mua và bán tiền mã hóa"),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Loại giao dịch",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            DropdownButtonFormField(
              items: [
                DropdownMenuItem(child: Text("Mua"), value: "buy"),
                DropdownMenuItem(child: Text("Bán"), value: "sell"),
              ],
              onChanged: (value) {
                // Xử lý chọn loại giao dịch
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                hintText: "Chọn loại giao dịch",
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Số lượng",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Nhập số lượng muốn mua/bán",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Xử lý mua hoặc bán
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Center(
                child: Text(
                  "Thực hiện",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
