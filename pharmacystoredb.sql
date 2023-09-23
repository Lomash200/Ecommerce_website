

CREATE TABLE `admin` (
  `userid` varchar(30) NOT NULL,
  `password` varchar(15) NOT NULL
);

CREATE TABLE `category` (
  `categoryId` int(11) NOT NULL,
  `categoryName` varchar(40) NOT NULL
);

CREATE TABLE `product` (
  `productid` int(11) NOT NULL,
  `productname` varchar(30) NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `description` varchar(100) NOT NULL,
  `categoryId` int(11) DEFAULT NULL
);

CREATE TABLE `productorder` (
  `orderid` int(11) NOT NULL,
  `orderdunits` int(11) NOT NULL,
  `address` varchar(100) NOT NULL,
  `ordereddate` date NOT NULL,
  `requesteddate` date NOT NULL,
  `accepted` tinyint(1) NOT NULL,
  `cancelled` tinyint(1) NOT NULL,
  `confirmed` tinyint(1) NOT NULL,
  `billamount` int(11) NOT NULL,
  `customerid` varchar(30) DEFAULT NULL,
  `productid` int(11) DEFAULT NULL
);

CREATE TABLE `user` (
  `userid` varchar(30) NOT NULL,
  `password` varchar(15) NOT NULL,
  `emailid` varchar(20) NOT NULL,
  `age` int(11) NOT NULL,
  `contact` varchar(12) NOT NULL,
  `city` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `pincode` varchar(6) NOT NULL
);

ALTER TABLE `admin`
  ADD PRIMARY KEY (`userid`);

ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryId`),
  ADD UNIQUE KEY `categoryName` (`categoryName`);

ALTER TABLE `product`
  ADD PRIMARY KEY (`productid`),
  ADD UNIQUE KEY `productname` (`productname`),
  ADD KEY `categoryId` (`categoryId`);

ALTER TABLE `productorder`
  ADD PRIMARY KEY (`orderid`),
  ADD KEY `productid` (`productid`),
  ADD KEY `customerid` (`customerid`);

ALTER TABLE `user`
  ADD PRIMARY KEY (`userid`);

ALTER TABLE `category`
  MODIFY `categoryId` int(11) NOT NULL AUTO_INCREMENT;
  
ALTER TABLE `product`
  MODIFY `productid` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `productorder`
  MODIFY `orderid` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `category` (`categoryId`);

ALTER TABLE `productorder`
  ADD CONSTRAINT `productorder_ibfk_1` FOREIGN KEY (`productid`) REFERENCES `product` (`productid`),
  ADD CONSTRAINT `productorder_ibfk_2` FOREIGN KEY (`customerid`) REFERENCES `user` (`userid`);
