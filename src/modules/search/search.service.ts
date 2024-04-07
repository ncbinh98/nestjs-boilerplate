import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { ElasticsearchService } from '@nestjs/elasticsearch';

@Injectable()
export class SearchService {
	constructor(private readonly esService: ElasticsearchService) {}

	public async createIndices(indices) {
		await this.esService.indices.create(indices, { ignore: [400] });
	}

	public async insertIndex(
		indexName: string,
		docId: string,
		docData: any,
	): Promise<any> {
		return await this.esService
			.index({
				index: indexName,
				id: docId,
				document: docData,
			})
			.then((res) => res)
			.catch((err) => {
				throw new HttpException(err, HttpStatus.INTERNAL_SERVER_ERROR);
			});
	}

	public async updateIndex(
		indexName: string,
		docId: string,
		docData: any,
	): Promise<any> {
		console.log(indexName, docId, docData);
		return await this.esService
			.update({
				index: indexName,
				id: docId,
				doc: docData,
			})
			.then((res) => res)
			.catch((err) => {
				throw new HttpException(err, HttpStatus.INTERNAL_SERVER_ERROR);
			});
	}

	public async searchIndex(indexName: string, searchData: any): Promise<any> {
		return await this.esService
			.search({
				index: indexName,
				query: searchData,
			})
			.then((res) => {
				return res.hits.hits;
			})
			.catch((err) => {
				throw new HttpException(err, HttpStatus.INTERNAL_SERVER_ERROR);
			});
	}

	public async deleteIndex(indexData: any): Promise<any> {
		return await this.esService.indices
			.delete(indexData)
			.then((res) => res)
			.catch((err) => {
				throw new HttpException(err, HttpStatus.INTERNAL_SERVER_ERROR);
			});
	}

	public async deleteDocument(indexData: any): Promise<any> {
		return await this.esService
			.delete(indexData)
			.then((res) => res)
			.catch((err) => {
				throw new HttpException(err, HttpStatus.INTERNAL_SERVER_ERROR);
			});
	}
}
