module.exports = {
	extends: ['@commitlint/config-conventional'],
	rules: {
		'type-enum': [
			2,
			'always',
			[
				'feat', // New Feature
				'fix', // Fix some bugs
				'improve', // Improve performance, optimized something...
				'refactor', // Refactor code...
				'docs', // Add document
				'chore', // A minor change in the development process
				'style', // Fixing font style, formatting errors, without affecting logic
				'test', // unit tests,...
				'revert', // revert commit
				'ci', // build ci/cd
				'build', // build project
			],
		],
		'type-case': [2, 'always', 'lower-case'],
		'type-empty': [2, 'never'],
		'scope-empty': [2, 'never'],
		'subject-empty': [2, 'never'],
		'subject-full-stop': [2, 'never', '.'],
		'header-max-length': [2, 'always', 72],
	},
};
